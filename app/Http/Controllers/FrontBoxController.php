<?php

namespace App\Http\Controllers;

use App\Helpers\StockMove;
use App\Models\AberturaCaixa;
use App\Models\Acessor;
use App\Models\Categoria;
use App\Models\CategoriaConta;
use App\Models\Certificado;
use App\Models\Cidade;
use App\Models\Cliente;
use App\Models\ComissaoVenda;
use App\Models\ConfigCaixa;
use App\Models\ConfigNota;
use App\Models\ContaReceber;
use App\Models\CreditoVenda;
use App\Models\Empresa;
use App\Models\FaturaFrenteCaixa;
use App\Models\Funcionario;
use App\Models\GrupoCliente;
use App\Models\ItemVendaCaixa;
use App\Models\ListaPreco;
use App\Models\NaturezaOperacao;
use App\Models\Pais;
use App\Models\Produto;
use App\Models\SangriaCaixa;
use App\Models\SuprimentoCaixa;
use App\Models\Tributacao;
use App\Models\TrocaVenda;
use App\Models\TrocaVendaCaixa;
use App\Models\Usuario;
use App\Models\Venda;
use App\Models\VendaCaixa;
use App\Models\VendaCaixaPreVenda;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use NFePHP\DA\NFe\Cupom;
use NFePHP\DA\NFe\CupomNaoFiscal;
use NFePHP\DA\NFe\CupomPedido;
use Svg\Tag\Rect;
use App\Models\Contigencia;
use App\Models\Filial;

use function Ramsey\Uuid\v1;

class FrontBoxController extends Controller
{
    protected $empresa_id = null;
    public function __construct()
    {

        if (!is_dir(public_path('xml_nfce'))) {
            mkdir(public_path('xml_nfce'), 0777, true);
        }
        if (!is_dir(public_path('xml_nfce_cancelada'))) {
            mkdir(public_path('xml_nfce_cancelada'), 0777, true);
        }

        $this->middleware(function ($request, $next) {
            request()->empresa_id = $request->empresa_id;
            $value = session('user_logged');
            if (!$value) {
                return redirect("/login");
            }
            return $next($request);
        });
    }

    public function index(Request $request)
    {   
        $view = $this->pdvAssincrono($request->prevenda_id);
        return $view;
    }

    private function validaCaixaAberto($funcionarios)
    {
        $temp = [];
        $config = ConfigNota::where('empresa_id', request()->empresa_id)->first();
        foreach ($funcionarios as $f) {
            $aberturaNfe = AberturaCaixa::where('empresa_id', request()->empresa_id)
            ->when($config->caixa_por_usuario == 1, function ($q) use ($f) {
                return $q->where('usuario_id', $f->usuario_id);
            })
            ->orderBy('id', 'desc')->first();
            if ($aberturaNfe != null) {
                if ($aberturaNfe->status == 0)
                    array_push($temp, $f);
            }
        }
        return $temp;
    }

    private function produtosMaisVendidos()
    {
        $itens = ItemVendaCaixa::selectRaw('item_venda_caixas.*, count(quantidade) as qtd')
        ->join('venda_caixas', 'venda_caixas.id', '=', 'item_venda_caixas.venda_caixa_id')
        ->where('venda_caixas.empresa_id', request()->empresa_id)
        ->groupBy('item_venda_caixas.produto_id')
        ->orderBy('qtd')
        ->limit(20)
        ->get();

        $produtos = [];
        foreach ($itens as $i) {
            $p = Produto::findOrFail($i->produto_id);
            if (!$p->inativo) {
                array_push($produtos, $p);
            }
        }
        return $produtos;
    }

    protected function pdvAssincrono($prevenda_id = null)
    {
        $item = null;
        if ($prevenda_id != null) {
            $item = VendaCaixaPreVenda::findOrFail($prevenda_id);
        }
        $config = ConfigNota::where('empresa_id', request()->empresa_id)
        ->first();
        if($config == null){
            session()->flash("flash_warning", "Configurar o emitente primeiramente!");
            return redirect()->route('configNF.index');
        }
        $naturezas = NaturezaOperacao::where('empresa_id', request()->empresa_id)
        ->get();
        $categorias = Categoria::where('empresa_id', request()->empresa_id)
        ->get();
        $produtos = Produto::where('empresa_id', request()->empresa_id)
        ->get();
        $tributacao = Tributacao::where('empresa_id', request()->empresa_id)
        ->get();
        $tiposPagamento = VendaCaixa::tiposPagamento();
        
        if ($config->nat_op_padrao == null) {
            session()->flash("flash_warning", "Informe a natureza de operação primeiramente!");
            return redirect()->route('configNF.index');
        }
        $certificado = Certificado::where('empresa_id', request()->empresa_id)
        ->first();
        $usuario = Usuario::findOrFail(get_id_user());
        if (count($naturezas) == 0 || $config == null || count($categorias) == 0  || count($produtos) == 0 || $tributacao == null) {
            $p = view("frontBox.alerta", compact(
                'produtos',
                'categorias',
                'naturezas',
                'config',
                'tributacao'
            ));
            return $p;
        } else {
            $tiposPagamentoMulti = VendaCaixa::tiposPagamentoMulti();
            $categorias = Categoria::where('empresa_id', request()->empresa_id)
            ->orderBy('nome')->get();
            $clientes = Cliente::orderBy('razao_social')
            ->where('empresa_id', request()->empresa_id)
            ->get();
            foreach ($clientes as $c) {
                $c->totalEmAberto = 0;
                $soma = $this->getTotalContaCredito($c);
                if ($soma->total != null) {
                    $c->totalEmAberto = $soma->total;
                }
            }
            $atalhos = ConfigCaixa::where('usuario_id', get_id_user())
            ->first();
            $lista = ListaPreco::where('empresa_id', request()->empresa_id)->get();
            $produtosMaisVendidos = $this->produtosMaisVendidos();
            $rascunhos = $this->getRascunhos();
            $preVendas = VendaCaixaPreVenda::where('empresa_id', request()->empresa_id)
            ->where('status', 0)
            ->limit(20)
            ->orderBy('id', 'desc')
            ->get();
            $funcionarios = Funcionario::where('funcionarios.empresa_id', request()->empresa_id)
            ->select('funcionarios.*')
            ->join('usuarios', 'usuarios.id', '=', 'funcionarios.usuario_id')
            ->get();

            $funcionarios = $this->validaCaixaAberto($funcionarios);
            if (sizeof($funcionarios) == 0 && $usuario->caixa_livre) {
                session()->flash("flash_erro", "Usuário definido para caixa livre, cadastre ao menos um funcionário!");
                return redirect('/funcionarios');
            }

            $usuarios = Usuario::where('empresa_id', request()->empresa_id)
            ->where('ativo', 1)
            ->orderBy('nome', 'asc')
            ->get();
            $vendedor = Funcionario::where('empresa_id', request()->empresa_id)->get();
            $estados = Cliente::estados();
            $cidades = Cidade::all();
            $pais = Pais::all();
            $grupos = GrupoCliente::get();
            $acessores = Acessor::where('empresa_id', request()->empresa_id)->get();
            $funcionarios = Funcionario::where('empresa_id', request()->empresa_id)->get();
            $filial = __get_local_padrao();

            $filial = Filial::find($filial);
            $abertura = AberturaCaixa::where('empresa_id', request()->empresa_id)
            ->where('usuario_id', get_id_user())
            ->where('status', 0)
            ->orderBy('id', 'desc')
            ->first();
            $sangrias = [];
            $suprimentos = [];
            $vendas = [];
            if ($abertura != null) {
                $sangrias = SangriaCaixa::where('empresa_id', request()->empresa_id)
                ->where('usuario_id', get_id_user())
                ->whereBetween('created_at', [
                    $abertura->created_at,
                    date('Y-m-d H:i:s')
                ])
                ->get();
                $suprimentos = SuprimentoCaixa::where('empresa_id', request()->empresa_id)
                ->where('usuario_id', get_id_user())
                ->whereBetween('created_at', [
                    $abertura->created_at,
                    date('Y-m-d H:i:s')
                ])
                ->get();
                $vendas = VendaCaixa::where('empresa_id', request()->empresa_id)
                ->where('usuario_id', get_id_user())
                ->whereBetween('created_at', [
                    $abertura->created_at,
                    date('Y-m-d H:i:s')
                ])->get();
            }
            return view('frontBox.index', compact(
                'tiposPagamento',
                'config',
                'item',
                'abertura',
                'certificado',
                'rascunhos',
                'preVendas',
                'estados',
                'sangrias',
                'vendas',
                'suprimentos',
                'cidades',
                'pais',
                'grupos',
                'acessores',
                'vendedor',
                'usuarios',
                'funcionarios',
                'lista',
                'produtosMaisVendidos',
                'atalhos',
                'usuario',
                'clientes',
                'categorias',
                'tiposPagamentoMulti',
                'filial'
            ));
        }
    }

    private function getTotalContaCredito($cliente)
    {
        return CreditoVenda::selectRaw('sum(vendas.valor_total) as total')
        ->join('vendas', 'vendas.id', '=', 'credito_vendas.venda_id')
        ->where('credito_vendas.cliente_id', $cliente->id)
        ->where('status', 0)
        ->first();
    }

    private function getRascunhos()
    {
        return VendaCaixa::where('rascunho', 1)
        ->where('empresa_id', request()->empresa_id)
        ->limit(20)
        ->orderBy('id', 'desc')
        ->get();
    }

    // private function preVendas()
    // {
    //     return PreVenda::where('empresa_id', request()->empresa_id)
    //         ->limit(20)
    //         ->orderBy('id', 'desc')
    //         ->get();
    // }


    public function store(Request $request)
    {
        try {
            DB::transaction(function () use ($request) {
                $valor_total = $this->somaItens($request);
                $empresa = Empresa::findOrFail($request->empresa_id);
                $request->merge([
                    'usuario_id' => get_id_user(),
                    'observacao' => $request->observacao ?? '',
                    'qtd_volumes' => $request->qtd_volumes ?? 0,
                    'peso_liquido' => $request->peso_liquido ?? 0,
                    'peso_bruto' => $request->peso_bruto ?? 0,
                    'desconto' => $request->desconto ?? 0,
                    'valor_total' => $valor_total,
                    'estado_emissao' => 'novo',
                    'sequencia_cce' => $request->sequencia_cce ?? 0,
                    'chave' => $request->chave ?? 0,
                    'acrescimo' => $request->acrescimo ?? 0,
                    'natureza_id' => $empresa->configNota->nat_op_padrao,
                    'dinheiro_recebido' => $request->valor_recebido ? __convert_value_bd($request->valor_recebido) : 0,
                    'troco' => 0,
                    'forma_pagamento' => '',
                    'tipo_pagamento' => $request->tipo_pagamento_row ? '99' : $request->tipo_pagamento,
                    'estado' => 'novo',
                    'nome' => $request->nome,
                    'cpf' => $request->cpf ?? '',
                    'pedido_delivery_id' => 0,
                    'qr_code_base64' => 0,
                ]);
                $vendaCaixa = VendaCaixa::create($request->all());
                $stockMove = new StockMove();
                for ($i = 0; $i < sizeof($request->produto_id); $i++) {
                    $product = Produto::findOrFail($request->produto_id[$i]);
                    $cfop = 0;
                    if ($empresa->configNota->natureza->sobrescreve_cfop) {
                        $cfop = $empresa->configNota->natureza->CFOP_saida_estadual;
                    } else {
                        $cfop = $product->CFOP_saida_estadual;
                    }
                    ItemVendaCaixa::create([
                        'venda_caixa_id' => $vendaCaixa->id,
                        'produto_id' => (int)$request->produto_id[$i],
                        'quantidade' => __convert_value_bd($request->quantidade[$i]),
                        'valor' => __convert_value_bd($request->valor_unitario[$i]),
                        'valor_custo' => $product->valor_compra,
                        'cfop' => $cfop,
                        'observacao' => $request->observacao ?? '',
                        'item_pedido_id' => null
                    ]);
                    $stockMove->downStock(
                        $product->id,
                        __convert_value_bd($request->quantidade[$i]),
                    );
                }
                if ($request->vendedor_id != null) {
                    $vendedor = Funcionario::where('empresa_id', $request->empresa_id)->first();
                    $vendedor->percentual_comissao;
                    $percentual_comissao = $vendedor->percentual_comissao;
                    $valorRetorno = $this->calcularComissaoVenda($vendaCaixa, $percentual_comissao);
                    ComissaoVenda::create([
                        'funcionario_id' => $request->vendedor_id,
                        'venda_id' => $vendaCaixa->id,
                        'tabela' => 'venda_caixas',
                        'valor' => $valorRetorno,
                        'status' => 0,
                        'empresa_id' => $request->empresa_id
                    ]);
                }
                if ($request->tipo_pagamento == '06') {
                    ContaReceber::create([
                        'venda_caixa_id' => $vendaCaixa->id,
                        'cliente_id' => $request->cliente_id,
                        'data_vencimento' => $request->data_vencimento,
                        'data_recebimento' => $request->data_vencimento,
                        'valor_integral' => __convert_value_bd($request->valor_total),
                        'valor_recebido' => 0,
                        'status' => 0,
                        'referencia' => "Parcela $i+1 da Compra código $vendaCaixa->id",
                        'categoria_id' => CategoriaConta::where('empresa_id', $request->empresa_id)->first()->id,
                        'empresa_id' => $request->empresa_id,
                        'juros' => 0,
                        'multa' => 0,
                        'observacao' => $request->obs ?? '',
                        'tipo_pagamento' => $request->tipo_pagamento
                    ]);
                }
                if ($request->tipo_pagamento_row) {
                    for ($i = 0; $i < sizeof($request->tipo_pagamento_row); $i++) {
                        if ($request->tipo_pagamento_row[$i] == '06') {
                            ContaReceber::create([
                                'venda_caixa_id' => $vendaCaixa->id,
                                'cliente_id' => $request->cliente_id,
                                'data_vencimento' => $request->data_vencimento_row[$i],
                                'data_recebimento' => $request->data_vencimento_row[$i],
                                'valor_integral' => __convert_value_bd($request->valor_integral_row[$i]),
                                'valor_recebido' => 0,
                                'status' => 0,
                                'referencia' => "Parcela $i+1 da Compra código $vendaCaixa->id",
                                'categoria_id' => CategoriaConta::where('empresa_id', $request->empresa_id)->first()->id,
                                'empresa_id' => $request->empresa_id,
                                'juros' => 0,
                                'multa' => 0,
                                'observacao' => $request->obs_row[$i] ?? '',
                                'tipo_pagamento' => $request->tipo_pagamento_row[$i]
                            ]);
                        }
                        FaturaFrenteCaixa::create([
                            'valor' => __convert_value_bd($request->valor_integral_row[$i]),
                            'forma_pagamento' => $request->tipo_pagamento_row[$i],
                            'venda_caixa_id' => $vendaCaixa->id
                        ]);
                    }
                }
                return true;
            });
session()->flash("flash_sucesso", "Venda realizada com sucesso!");
} catch (\Exception $e) {
    echo $e->getMessage() . '<br>' . $e->getLine();
    die;
    session()->flash("flash_erro", "Algo deu errado por aqui: " . $e->getMessage());
    __saveLogError($e, request()->empresa_id);
}
return redirect()->route('frenteCaixa.index');
}

private function somaItens($request)
{
    $valor_total = 0;
    for ($i = 0; $i < sizeof($request->produto_id); $i++) {
        $valor_total += __convert_value_bd($request->subtotal_item[$i]);
    }
    return $valor_total;
}


private function calcularComissaoVenda($vendaCaixa, $percentual_comissao)
{
    $valorRetorno = 0;
    foreach ($vendaCaixa->itens as $i) {
        if ($i->produto->perc_comissao > 0) {
            $valorRetorno += (($i->valor * $i->quantidade) * $i->produto->perc_comissao) / 100;
        } else {
            $valorRetorno += (($i->valor * $i->quantidade) * $percentual_comissao) / 100;
        }
    }
    return $valorRetorno;
}

public function devolucao(Request $request)
{
    $data = VendaCaixa::where('empresa_id', $request->empresa_id)
    ->orderBy('id', 'desc')
    ->get();
    $caixa = AberturaCaixa::where('status', 1)->where('empresa_id', request()->empresa_id)
    ->orderBy('id', 'desc')->first();
    $config = ConfigNota::where('empresa_id', request()->empresa_id)
    ->first();
    if ($caixa != null) {
        foreach ($data as $v) {
            if (strtotime($v->created_at) < strtotime($caixa->updated_at)) {
                $v->impedeDelete = true;
            }
        }
    }
    return view('frontBox.devolucao', compact('data'));
}


public function troca()
{
    $data = TrocaVenda::where('empresa_id', request()->empresa_id)
    ->paginate(20);
    return view('frontBox.troca', compact('data'));
}

public function fecharCaixa()
{
    $config = ConfigNota::where('empresa_id', request()->empresa_id)->first();
        // $aberturaCaixa = AberturaCaixa::where('empresa_id', request()->empresa_id)->first();
        // $aberturaCaixa->created_at;
    $aberturaNfe = AberturaCaixa::where('ultima_venda_nfe', 0)
    ->where('empresa_id', request()->empresa_id)
    ->when($config->caixa_por_usuario == 1, function ($q) use ($config) {
        return $q->where('usuario_id', get_id_user());
    })->orderBy('id', 'desc')->first();
    $aberturaNfce = AberturaCaixa::where('ultima_venda_nfce', 0)
    ->where('empresa_id', request()->empresa_id)
    ->when($config->caixa_por_usuario == 1, function ($q) use ($config) {
        return $q->where('usuario_id', get_id_user());
    })->orderBy('id', 'desc')->first();
    $ultimaFechadaNfe = AberturaCaixa::where('ultima_venda_nfe', '>', 0)
    ->where('empresa_id', request()->empresa_id)
    ->when($config->caixa_por_usuario == 1, function ($q) use ($config) {
        return $q->where('usuario_id', get_id_user());
    })->orderBy('id', 'desc')->first();
    $ultimaFechadaNfce = AberturaCaixa::where('ultima_venda_nfce', '>', 0)
    ->where('empresa_id', request()->empresa_id)
    ->when($config->caixa_por_usuario == 1, function ($q) use ($config) {
        return $q->where('usuario_id', get_id_user());
    })->orderBy('id', 'desc')->first();
    $ultimaVendaCaixa = VendaCaixa::where('empresa_id', request()->empresa_id)
    ->when($config->caixa_por_usuario == 1, function ($q) use ($config) {
        return $q->where('usuario_id', get_id_user());
    })->orderBy('id', 'desc')->first();
    $ultimaVenda = Venda::where('empresa_id', request()->empresa_id)
    ->when($config->caixa_por_usuario == 1, function ($q) use ($config) {
        return $q->where('usuario_id', get_id_user());
    })->orderBy('id', 'desc')->first();
    $vendas = [];
    $somaTiposPagamento = [];
    if ($ultimaVendaCaixa != null || $ultimaVenda != null) {
        $ultimaVendaCaixa = $ultimaVendaCaixa != null ? $ultimaVendaCaixa->id : 0;
        $ultimaVenda = $ultimaVenda != null ? $ultimaVenda->id : 0;
        $vendasPdv = VendaCaixa::whereBetween('id', [
            ($ultimaFechadaNfce != null ? $ultimaFechadaNfce->ultima_venda_nfce + 1 : 0),
            $ultimaVendaCaixa
        ])
        ->where('empresa_id', request()->empresa_id)
        ->get();
        $vendas = Venda::whereBetween('id', [
            ($ultimaFechadaNfe != null ? $ultimaFechadaNfe->ultima_venda_nfe + 1 : 0),
            $ultimaVenda
        ])
        ->where('empresa_id', request()->empresa_id)
        ->get();
        $vendas = $this->agrupaVendas($vendas, $vendasPdv);
        $somaTiposPagamento = $this->somaTiposPagamento($vendas);
    }
    $abertura = $aberturaNfe != null ? $aberturaNfe : $aberturaNfce;
    return view('frontBox.fechamento', compact(
        'vendas',
        'abertura',
        'somaTiposPagamento'
    ));
}

private function somaTiposPagamento($vendas)
{
    $tipos = $this->preparaTipos();
    foreach ($vendas as $v) {
        if ($v->estado != 'CANCELADO') {
            if (isset($tipos[$v->tipo_pagamento])) {
                if ($v->tipo_pagamento != 99) {
                    if (isset($v->NFcNumero)) {
                        if (!$v->rascunho && !$v->consignado) {
                            $tipos[$v->tipo_pagamento] += $v->valor_total;
                        }
                    } else {
                        if ($v->duplicatas && sizeof($v->duplicatas) > 0) {
                            foreach ($v->duplicatas as $d) {
                                $tipos[Venda::getTipoPagamentoNFe($d->tipo_pagamento)] += $d->valor_integral;
                            }
                        } else {
                            $tipos[$v->tipo_pagamento] += $v->valor_total - $v->desconto;
                        }
                    }
                } else {
                    if (isset($v->duplicatas)) {
                        foreach ($v->duplicatas as $d) {
                            $tipos[Venda::getTipoPagamentoNFe($d->tipo_pagamento)] += $d->valor_integral;
                        }
                    } else {
                        $tipos[$v->tipo_pagamento] += $v->valor_total - $v->desconto;
                    }
                }
            } else {
                if ($v->fatura) {
                    foreach ($v->fatura as $f) {
                        $tipos[$f->forma_pagamento] += $f->valor;
                    }
                }
            }
        }
    }
    return $tipos;
}

private function preparaTipos()
{
    $temp = [];
    foreach (VendaCaixa::tiposPagamento() as $key => $tp) {
        $temp[$key] = 0;
    }
    return $temp;
}

public function configuracao()
{
    $item = ConfigCaixa::where('usuario_id', get_id_user())
    ->first();
    if ($item != null) {
        $item->tipos_pagamento = json_decode($item->tipos_pagamento) ? json_decode($item->tipos_pagamento) : [];
    }
    return view('frontBox.create', compact('item'));
}

public function storeConfig(Request $request)
{
    $item = ConfigCaixa::where('usuario_id', get_id_user())
    ->first();
    try {
        if ($item == null) {
            $request->merge([
                'finalizar' => $request->finalizar ?? '',
                'reiniciar' => $request->reiniciar ?? '',
                'editar_desconto' => $request->editar_desconto ?? '',
                'editar_acrescimo' => $request->editar_acrescimo ?? '',
                'editar_observacao' => $request->editar_observacao ?? '',
                'setar_valor_recebido' => $request->setar_valor_recebido ?? '',
                'forma_pagamento_dinheiro' => $request->forma_pagamento_dinheiro ?? '',
                'forma_pagamento_debito' => $request->forma_pagamento_debito ?? '',
                'forma_pagamento_credito' => $request->forma_pagamento_credito ?? '',
                'setar_quantidade' => $request->setar_quantidade ?? '',
                'forma_pagamento_pix' => $request->forma_pagamento_pix ?? '',
                'setar_leitor' => $request->setar_leitor ?? '',
                'finalizar_fiscal' => $request->finalizar_fiscal ?? '',
                'finalizar_nao_fiscal' => $request->finalizar_nao_fiscal ?? '',
                'valor_recebido_automatico' => 0,
                // 'modelo_pdv' => $request->modelo_pdv,
                'balanca_valor_peso' => $request->balanca_valor_peso,
                'balanca_digito_verificador' => $request->balanca_digito_verificador ?? 5,
                'valor_recebido_automatico' => 0,
                'impressora_modelo' => $request->impressora_modelo ?? 80,
                'usuario_id' => get_id_user(),
                'mercadopago_public_key' => $request->mercadopago_public_key ?? '',
                'mercadopago_access_token' => $request->mercadopago_access_token ?? '',
                'tipos_pagamento' => json_encode($request->tipos_pagamento),
                'pagamento_padrao' => $request->pagamento_padrao ?? ''
            ]);
            ConfigCaixa::create($request->all());
            session()->flash("flash_sucesso", "Cadastrado com sucesso");
        } else {
            $request->merge([
                'finalizar' => $request->finalizar ?? '',
                'reiniciar' => $request->reiniciar ?? '',
                'editar_desconto' => $request->editar_desconto ?? '',
                'editar_acrescimo' => $request->editar_acrescimo ?? '',
                'editar_observacao' => $request->editar_observacao ?? '',
                'setar_valor_recebido' => $request->setar_valor_recebido ?? '',
                'forma_pagamento_dinheiro' => $request->forma_pagamento_dinheiro ?? '',
                'forma_pagamento_debito' => $request->forma_pagamento_debito ?? '',
                'forma_pagamento_credito' => $request->forma_pagamento_credito ?? '',
                'setar_quantidade' => $request->setar_quantidade ?? '',
                'forma_pagamento_pix' => $request->forma_pagamento_pix ?? '',
                'setar_leitor' => $request->setar_leitor ?? '',
                'finalizar_fiscal' => $request->finalizar_fiscal ?? '',
                'finalizar_nao_fiscal' => $request->finalizar_nao_fiscal ?? '',
                'valor_recebido_automatico' => 0,
                // 'modelo_pdv' => $request->modelo_pdv,
                'balanca_valor_peso' => $request->balanca_valor_peso,
                'balanca_digito_verificador' => $request->balanca_digito_verificador ?? 5,
                'valor_recebido_automatico' => 0,
                'impressora_modelo' => $request->impressora_modelo ?? 80,
                'usuario_id' => get_id_user(),
                'mercadopago_public_key' => $request->mercadopago_public_key ?? '',
                'mercadopago_access_token' => $request->mercadopago_access_token ?? '',
                'tipos_pagamento' => json_encode($request->tipos_pagamento),
                'pagamento_padrao' => $request->pagamento_padrao ?? ''
            ]);
            $item->fill($request->all())->save();
            session()->flash("flash_sucesso", "Cadastro atualizado!");
        }
    } catch (\Exception $e) {
        session()->flash("flash_erro", "Algo deu Errado" . $e->getMessage());
        __saveLogError($e, request()->empresa_id);
    }
    return redirect()->route('frenteCaixa.configuracao');
}


private function agrupaVendas($vendas, $vendasPdv)
{
    $temp = [];
    foreach ($vendas as $v) {
        $v->tipo = 'VENDA';
        array_push($temp, $v);
    }
    foreach ($vendasPdv as $v) {
        $v->tipo = 'PDV';
        array_push($temp, $v);
    }
    return $temp;
}

public function detalhes($id)
{
    $item = VendaCaixa::findOrFail($id);

    return view('caixa.detalhes', compact('item'));
}

public function fecharPost(Request $request)
{
    $id = $request->abertura_id;
    $abertura = AberturaCaixa::findOrFail($id);
    $ultimaVendaCaixa = VendaCaixa::where('empresa_id', $request->empresa_id)
    ->orderBy('id', 'desc')->first();
    $ultimaVenda = Venda::where('empresa_id', $request->empresa_id)
    ->orderBy('id', 'desc')->first();
    try {
        $abertura->ultima_venda_nfce = $ultimaVendaCaixa != null ? $ultimaVendaCaixa->id : 0;
        $abertura->ultima_venda_nfe = $ultimaVenda != null ? $ultimaVenda->id : 0;
        $abertura->status = true;
        $abertura->valor_dinheiro_caixa = __convert_value_bd($request->valor_dinheiro_caixa);
        $abertura->save();
        session()->flash("flash_sucesso", "Caixa fechado com sucesso!");
    } catch (\Exception $e) {
        session()->flash("flash_erro", "Algo deu errado" . $e->getMessage());
        __saveLogError($e, request()->empresa_id);
    }
    if (isset($request->redirect)) {
        return redirect($request->redirect);
    }
    return redirect()->route('frenteCaixa.list');
}

public function listaFechamento($id)
{
    $aberturas = AberturaCaixa::where('empresa_id', request()->empresa_id)
    ->get();
    $abertura = null;
    $inicio = 0;
    $fim = 0;
    for ($i = 0; $i < sizeof($aberturas); $i++) {
        if ($aberturas[$i]->id == $id) {
            $abertura = $aberturas[$i];
            if ($i > 0) {
                $inicio = $aberturas[$i - 1]->ultima_venda + 1;
            }
            $fim = $aberturas[$i]->ultima_venda;
        }
    }
    $vendas = [];
    $somaTiposPagamento = [];
    $vendas = VendaCaixa
    ::whereBetween('id', [
        $inicio,
        $fim
    ])
    ->get();
    $somaTiposPagamento = $this->somaTiposPagamento($vendas);
    return view('frontBox.lista_fecha_caixa', compact('vendas', 'abertura', 'somaTiposPagamento'));
}

public function list(Request $request)
{
    $start_date = $request->start_date;
    $end_date = $request->end_date;
    $valor = $request->valor;
    $estado = $request->estado;
    $numero_nfe = $request->numero_nfe;

    $item = VendaCaixa::where('empresa_id', request()->empresa_id)->get();
    $somaTiposPagamento = $this->somaTiposPagamento($item);

    $config = ConfigNota::where('empresa_id', request()->empresa_id)->first();
    $data = VendaCaixa::where('empresa_id', $request->empresa_id)
    ->when(!empty($start_date), function ($query) use ($start_date) {
        return $query->whereDate('created_at', '>=', $start_date);
    })
    ->when(!empty($end_date), function ($query) use ($end_date) {
        return $query->whereDate('created_at', '<=', $end_date);
    })
    ->when(!empty($valor), function ($query) use ($valor) {
        return $query->where('valor', $valor);
    })
    ->when($estado != "", function ($query) use ($estado) {
        return $query->where('estado_emissao', $estado);
    })
    ->when($numero_nfe != "", function ($query) use ($numero_nfe) {
        return $query->where('numero_nfce', $numero_nfe);
    })
    ->orderBy('created_at', 'desc')
    ->paginate(env("PAGINACAO"));

    $contigencia =  $this->getContigencia();
    return view('frontBox.list', compact('data', 'config', 'contigencia', 'somaTiposPagamento'));
}

private function getContigencia()
{
    $active = Contigencia::where('empresa_id', request()->empresa_id)
    ->where('status', 1)
    ->where('documento', 'NFCe')
    ->first();
    return $active;
}

public function imprimirNaoFiscal($id)
{
    $item = VendaCaixa::findOrFail($id);
    if (valida_objeto($item)) {
        $config = ConfigNota::where('empresa_id', $item->empresa_id)
        ->first();
        if ($config->logo) {
            $logo = 'data://text/plain;base64,' . base64_encode(file_get_contents(public_path('uploads/configEmitente/') . $config->logo));   
        } else {
            $logo = null;
        }
        $usuario = Usuario::find(get_id_user());
        $cupom = new CupomNaoFiscal($item, $config);

        if ($usuario->config) {
            $cupom->setPaperWidth($usuario->config->impressora_modelo);
        }
        $pdf = $cupom->render($logo);
        return response($pdf)
        ->header('Content-Type', 'application/pdf');
    } else {
        return redirect('/403');
    }
}

private function revertStock($itens)
{
    $stockMove = new StockMove();
    foreach ($itens as $i) {
        $stockMove->pluStock(
            $i->produto_id,
            __convert_value_bd($i->quantidade),
            $itens[0]->venda->filial_id
        );
    }
}

public function destroy($id)
{
    $item = VendaCaixa::findOrFail($id);
    if (!__valida_objeto($item)) {
        abort(403);
    }
    try {
        $this->revertStock($item->itens);
        $item->delete();
        session()->flash("flash_sucesso", "Venda deletada!");
    } catch (\Exception $e) {
        session()->flash("flash_erro", "Algo deu errado: " . $e->getMessage());
        __saveLogError($e, request()->empresa_id);
    }
    return redirect()->back();
}
}
