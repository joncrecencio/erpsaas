<?php


Route::get('/clear-all', function(){
    \Artisan::call('cache:clear');
    \Artisan::call('config:clear');
    \Artisan::call('view:clear');
    // system('composer dump-autoload');
});

Route::group(['prefix' => 'cadastro'], function () {
    Route::get('/', 'UserController@cadastro');
    Route::post('/store', 'UserController@storeEmpresa')->name('cadastro.storeEmpresa');
    Route::get('/plano', 'UserController@plano');
    Route::post('/recuperarSenha', 'UserController@recuperarSenha')->name('recuperarSenha');
});

Route::get('/novoparceiro', 'UserController@novoparceiro');
Route::get('/ajuste', 'EmpresaController@ajuste');


Route::group(['prefix' => '/ajax'], function () {
    Route::get('/', 'AjaxController@index');
});

Route::get('/', function () {
    // Route::get('/', 'DeliveryController@index');
    return redirect('/login');
});

Route::group(['prefix' => 'login'], function () {
    Route::get('/', 'UserController@newAccess');
    Route::get('/logoff', 'UserController@logoff')->name('logoff');
    Route::post('/request', 'UserController@request')->name('login.request')
    ->middleware('usuariosLogado');
});

Route::get('/response/{code}', 'CotacaoResponseController@response');
Route::post('/responseSave', 'CotacaoResponseController@responseSave');

Route::get('/error', function () {
    return view('sempermissao')->with('title', 'Acesso Bloqueado');
});

Route::group(['prefix' => 'migrador'], function () {
    Route::get('/{empresa_id}', 'MigradorController@index');
    Route::post('/', 'MigradorController@save');
});

Route::group(['prefix' => 'online', 'middleware' => 'verificaEmpresa'], function () {
    Route::get('/', 'EmpresaController@online')->name('online');
});

Route::group(['prefix' => 'ticketsSuper'], function () {
    Route::get('/finalizar/{id}', 'TicketSuperController@finalizar')->name('ticketsSuper.finalizar');
    Route::post('/finalizarPost', 'TicketSuperController@finalizarPost')->name('ticketsSuper.finalizarPost');
});
Route::resource('ticketsSuper', 'TicketSuperController')->middleware('verificaEmpresa');

Route::group(['prefix' => 'relatorioSuper', 'middleware' => 'verificaEmpresa'], function () {
    Route::get('/', 'RelatorioSuperController@index')->name('relatorioSuper.index');
    Route::get('/empresas', 'RelatorioSuperController@empresas')->name('relatorioSuper.empresas');
    Route::get('/certificados', 'RelatorioSuperController@certificados')->name('relatorioSuper.certificados');
    Route::get('/extratoCliente', 'RelatorioSuperController@extratoCliente')->name('relatorioSuper.extratoCliente');
    Route::get('/empresasContador', 'RelatorioSuperController@empresasContador')->name('relatorioSuper.contador');
    Route::get('/historicoAcessos', 'RelatorioSuperController@historicoAcessos')->name('relatorioSuper.historico');
});

Route::group(['prefix' => '/assinarContrato', 'middleware' => 'verificaEmpresa'], function () {
    Route::get('/', 'AssinarContratoController@index');
    Route::post('/', 'AssinarContratoController@assinar')->name('assinarContrato.assinar');
});

Route::resource('etiquetas', 'EtiquetaController')->middleware('verificaEmpresa');

Route::group(['prefix' => '/payment', 'middleware' => 'verificaEmpresa'], function () {
    Route::get('/', 'PaymentController@index')->name('payment.index');
    Route::post('/payment-pix', 'PaymentController@paymentPix')->name('payment.pix');
    Route::post('/payment-card', 'PaymentController@paymentCard')->name('payment.card');

    Route::get('/finish', 'PaymentController@finish')->name('payment.finish');
    Route::post('/setPlano', 'PaymentController@setPlano');
    Route::get('/{code}', 'PaymentController@detalhesPagamento')->name('payment.detail');
    Route::get('/consulta/{code}', 'PaymentController@consultaPagamento');
});

Route::group(['prefix' => 'config', 'middleware' => 'verificaEmpresa'], function () {
    Route::get('/', 'ConfigController@index')->name('config.index');
    Route::get('/remove-cor', 'ConfigController@removeCor');
    Route::post('/store', 'ConfigController@store')->name('config.store');
});

Route::middleware([
    'verificaEmpresa', 'validaAcesso', 'verificaContratoAssinado', 'limiteArmazenamento'
])->group(function () {

    Route::resource('nfse', 'NfseController');
    Route::get('nfse/imprimir/{id}', 'NfseController@imprimir')->name('nfse.imprimir');

    Route::resource('boletos', 'BoletoController');
    Route::resource('sintegra', 'SintegraController');

    Route::post('/boletos-store-issue', 'BoletoController@storeIssue')->name('boletos.store-issue');
    Route::get('/boletos/print/{id}', 'BoletoController@print')->name('boletos.print');

    Route::resource('remessa-boletos', 'RemessaBoletoController');
    Route::resource('contigencia', 'ContigenciaController');
    Route::get('/contigencia-desactive/{id}', 'ContigenciaController@desactive')->name('contigencia.desactive');

    Route::get('/remessa/sem-remessa', 'RemessaBoletoController@semRemessa')->name('remessa.sem-remessa');
    Route::get('/remessa-download/{id}', 'RemessaBoletoController@download')->name('remessa-boletos.download');

    Route::group(['prefix' => 'telasPedido'], function () {
        Route::get('/', 'TelaPedidoController@index');
        Route::get('/new', 'TelaPedidoController@new');
        Route::post('/save', 'TelaPedidoController@save');
        Route::post('/update', 'TelaPedidoController@update');
        Route::get('/edit/{id}', 'TelaPedidoController@edit');
        Route::get('/delete/{id}', 'TelaPedidoController@delete');
    });


    Route::group(['prefix' => 'remessasBoleto'], function () {
        Route::get('/', 'RemessaController@index');
        Route::get('/boletosSemRemessa', 'RemessaController@boletosSemRemessa');
        Route::get('/gerarRemessaMulti/{boletos}', 'RemessaController@gerarRemessaMulti');
        Route::get('/ver/{id}', 'RemessaController@ver');
        Route::get('/delete/{id}', 'RemessaController@delete');
        Route::get('/download/{id}', 'RemessaController@download');
    });

    Route::group(['prefix' => '/financeiro'], function () {
        //     Route::get('/', 'FinanceiroController@index');
        //     Route::get('/filtro', 'FinanceiroController@filtro');
        Route::get('/list', 'FinanceiroController@list')->name('financeiro.list');
        //     Route::get('/pay/{id}', 'FinanceiroController@pay');
        //     Route::post('/pay', 'FinanceiroController@payStore');
        //     Route::get('/detalhes/{id}', 'FinanceiroController@detalhes');
        //     Route::get('/verificaPagamentos', 'FinanceiroController@verificaPagamentos');
        //     Route::get('/removerPlano/{id}', 'FinanceiroController@removerPlano');
    });

    Route::resource('financeiro', 'FinanceiroController');

    Route::group(['prefix' => '/contadores'], function () {
        Route::post('/set-empresa', 'ContadorController@setEmpresa')->name('contadores.set-empresa');
    });

    Route::resource('contadores', 'ContadorController');

    Route::resource('ibpt', 'IbptController');

    Route::group(['prefix' => '/contrato'], function () {
        Route::get('/impressao', 'ContratoController@impressao');
        Route::get('/gerarContrato/{empresa_id}', 'ContratoController@gerarContrato')->name('contrato.gerarContrato');
        Route::get('/download/{empresa_id}', 'ContratoController@download')->name('contrato.download');
        Route::get('/imprimir/{empresa_id}', 'ContratoController@imprimir')->name('contrato.imprimir');
    });

    Route::resource('contrato', 'ContratoController');

    Route::group(['prefix' => 'contador'], function () {
        Route::get('/', 'Contador\\ContadorController@index')->name('contador.index');
        Route::post('/set-empresa', 'Contador\\ContadorController@setEmpresa')->name('contador.set-empresa');
        Route::get('/clientes', 'Contador\\ContadorController@clientes')->name('contador.clientes');
        Route::get('/fornecedores', 'Contador\\ContadorController@fornecedores')->name('contador.fornecedores');
        Route::get('/produtos', 'Contador\\ContadorController@produtos')->name('contador.produtos');
        Route::get('/vendas', 'Contador\\ContadorController@vendas')->name('contador.vendas');
        Route::get('/venda-download-xml/{id}', 'Contador\\ContadorController@downloadXmlNfe')->name('contador.venda-download-xml');
        Route::get('/pdv', 'Contador\\ContadorController@pdv')->name('contador.pdv');
        Route::get('/pdv-download-xml/{id}', 'Contador\\ContadorController@downloadXmlPdv')->name('contador.pdv-download-xml');
        Route::get('/empresas', 'Contador\\ContadorController@empresas')->name('contador.empresa');
        Route::get('/empresa-detalhe/{id}', 'Contador\\ContadorController@empresaDetalhe')->name('contador.empresaDetalhes');
        Route::get('/download-certificado/{id}', 'Contador\\ContadorController@downloadCertificado')->name('contador.downloadCertificado');
        Route::get('/download-xml-nfe', 'Contador\\ContadorController@downloadFiltroXmlNfe')->name('contador.download-xml-nfe');
        Route::get('/download-xml-nfce', 'Contador\\ContadorController@downloadFiltroXmlNfce')->name('contador.download-xml-nfce');
    });

    Route::group(['prefix' => '/empresas'], function () {
        Route::get('/alterarSenha/{id}', 'EmpresaController@alterarSenha')->name('empresas.alterarSenha');
        Route::put('/alterarSenhaPost', 'EmpresaController@alterarSenhaPost')->name('empresas.alterarSenhaPost');
        Route::get('/detalhes/{id}', 'EmpresaController@detalhes')->name('empresas.detalhes');
        Route::get('/setarPlano/{id}', 'EmpresaController@setarPlano')->name('empresas.setarPlano');
        Route::post('/setarPlanoPost', 'EmpresaController@setarPlanoPost')->name('empresas.setarPlanoPost');
        Route::get('/alterarStatus/{id}', 'EmpresaController@alterarStatus')->name('empresas.alterarStatus');
        Route::get('/download/{id}', 'EmpresaController@download')->name('empresas.download');
        Route::get('/arquivosXml/{id}', 'EmpresaController@arquivosXml')->name('empresas.arquivosXml');
        Route::get('/filtroXml', 'EmpresaController@filtroXml')->name('empresas.filtroXml');
        Route::get('/configEmitente/{empresa_id}', 'EmpresaController@configEmitente')->name('empresas.configEmitente');
        Route::post('/storeConfig', 'EmpresaController@storeConfig')->name('empresas.storeConfig');
        Route::get('/login/{empresa_id}', 'EmpresaController@login')->name('empresas.login');
        Route::get('/buscar', 'EmpresaController@buscar')->name('empresas.buscar');
    });

    Route::resource('empresas', 'EmpresaController');


    Route::group(['prefix' => '/representantes'], function () {
        //     Route::get('/', 'RepresentanteController@index');
        //     Route::get('/novo', 'RepresentanteController@novo');
        //     Route::post('/save', 'RepresentanteController@save');
        //    Route::get('/detalhes/{id}', 'RepresentanteController@detalhes')->name('representantes.detalhes');
        //     Route::post('/update', 'RepresentanteController@update');
        //     Route::post('/saveEmpresa', 'RepresentanteController@saveEmpresa');
        //     Route::get('/delete/{id}', 'RepresentanteController@delete');
        Route::get('/empresas/{id}', 'RepresentanteController@empresas')->name('representantes.empresas');
        //     Route::get('/deleteAttr/{id}', 'RepresentanteController@deleteAttr');
        //     Route::get('/alterarSenha/{id}', 'RepresentanteController@alterarSenha');
        //     Route::post('/alterarSenha', 'RepresentanteController@alterarSenhaPost');
        //     Route::get('/filtro', 'RepresentanteController@filtro');
        Route::get('/financeiro/{id}', 'RepresentanteController@financeiro')->name('representantes.financeiro');
        //     Route::get('/filtroFinanceiro', 'RepresentanteController@filtroFinanceiro');
        //     Route::get('/pagarComissao/{id}', 'RepresentanteController@pagarComissao');
    });


    Route::resource('representantes', 'RepresentanteController');


    Route::resource('filial', 'FilialController');

    Route::resource('rep', 'RepController');

    Route::resource('planos', 'PlanoController');

    Route::group(['prefix' => '/planosPendentes'], function () {
        //    Route::get('/', 'PlanoRepresentanteController@index');
        Route::get('/ativar/{id}', 'PlanoRepresentanteController@ativar');
        //    Route::get('/delete/{id}', 'PlanoRepresentanteController@delete');
    });

    Route::resource('planosPendentes', 'PlanoRepresentanteController');

    Route::resource('perfilAcesso', 'PerfilAcessoController');

    Route::resource('pesquisa', 'PesquisaController');

    Route::resource('alertas', 'AlertaController');

    Route::resource('errosLog', 'ErrosLogController');


    Route::group(['prefix' => '/appUpdate'], function () {
        Route::get('/sql', 'AppUpdateController@sql')->name('appUpdate.sql');
        Route::post('/sql', 'AppUpdateController@sqlStore')->name('appUpdate.sqlStore');
        Route::post('/run-sql', 'AppUpdateController@runSql')->name('appUpdate.run-sql');
        Route::get('/download', 'AppUpdateController@download')->name('appUpdate.download');
    });

    Route::resource('appUpdate', 'AppUpdateController');

    Route::resource('destaquesDelivery', 'DestaqueDeliveryController');
    Route::resource('cuponsEcommerce', 'CupomEcommerceController');

    Route::group(['prefix' => '/dre'], function () {
        //     Route::get('/', 'DreController@index');
        Route::get('/list', 'DreController@list')->name('dre.list');
        //     Route::get('/ver/{id}', 'DreController@ver');
        Route::get('/deleteLancamento/{id}', 'DreController@deleteLancamento')->name('dre.deleteLancamento');
        Route::get('/imprimir/{id}', 'DreController@imprimir')->name('dre.imprimir');
        //     Route::post('/save', 'DreController@save');
        Route::post('/novolancamento', 'DreController@novolancamento')->name('dre.novolancamento');
        Route::post('/updatelancamento', 'DreController@updatelancamento')->name('dre.updatelancamento');
        // Route::get('/delete/{id}', 'DreController@delete')->name('dre.');
    });

    Route::resource('dre', 'DreController');

    Route::get('/rotaEntrega/{id}', 'DeliveryController@rotaEntrega');

    Route::group(['prefix' => '/pagseguro'], function () {
        Route::get('/getSessao', 'PagSeguroController@getSessao');
        Route::post('/efetuaPagamento', 'PagSeguroController@efetuaPagamento');
        Route::get('/consultaJS', 'PagSeguroController@consultaJS');
        Route::get('/getFuncionamento', 'PagSeguroController@getFuncionamento');
    });

    Route::group(['prefix' => '/agendamentos'], function () {
        //     Route::get('/', 'AgendamentoController@index');
        //     Route::get('/all', 'AgendamentoController@all');
        //     Route::get('/filtro', 'AgendamentoController@filtro');
        //     Route::post('/saveCliente', 'AgendamentoController@saveCliente');
        //     Route::post('/save', 'AgendamentoController@save');
        //     Route::get('/detalhes/{id}', 'AgendamentoController@detalhes');
        //     Route::get('/delete/{id}', 'AgendamentoController@delete');
        Route::get('/alterarStatus/{id}', 'AgendamentoController@alterarStatus')->name('agendamentos.alterarStatus');
        //     Route::get('/irParaFrenteCaixa/{id}', 'AgendamentoController@irParaFrenteCaixa');
        Route::get('/comissao', 'AgendamentoController@comissao')->name('agendamentos.comissao');
        //     Route::get('/filtrarComissao', 'AgendamentoController@filtrarComissao');
        Route::get('/servicos', 'AgendamentoController@servicos')->name('agendamentos.servicos');
        //     Route::get('/filtrarServicos', 'AgendamentoController@filtrarServicos');
    });


    Route::resource('agendamentos', 'AgendamentoController');


    Route::resource('eventoSalario', 'EventoSalarioController');

    Route::resource('funcionarioEventos', 'FuncionarioEventoController');

    Route::resource('apuracaoMensal', 'ApuracaoMensalController');

    Route::get('/apuracaoMensal/getEventos/{funcionario_id}', 'ApuracaoMensalController@getEventos')->name('apuracaoMensal.getEventos');


    // Route::group(['prefix' => '/eventos', 'middleware' => ['validaEvento']], function () {
    //     Route::get('/', 'EventoController@index');
    //     Route::get('/pesquisa', 'EventoController@pesquisa');
    //     Route::get('/novo', 'EventoController@novo');
    //     Route::post('/save', 'EventoController@save')->middleware('limiteEvento');
    //     Route::post('/update', 'EventoController@update');
    //     Route::get('/edit/{id}', 'EventoController@edit');
    //     Route::get('/delete/{id}', 'EventoController@delete');
    //     Route::get('/funcionarios/{id}', 'EventoController@funcionarios');
    //     Route::post('/saveFuncionario', 'EventoController@saveFuncionario');
    //     Route::get('/removeFuncionario/{id}', 'EventoController@removeFuncionario');
    //     Route::get('/atividades/{id}', 'EventoController@atividades');
    //     Route::get('/filtroAtividade', 'EventoController@filtroAtividade');
    //     Route::get('/novaAtividade/{id}', 'EventoController@novaAtividade');
    //     Route::post('/storeAtividade', 'EventoController@storeAtividade');
    //     Route::get('/finalizarAtividade/{id}', 'EventoController@finalizarAtividade');
    //     Route::post('/finalizarAtividade', 'EventoController@finalizarAtividadeSave');
    //     Route::get('/movimentacao', 'EventoController@movimentacao');
    //     Route::get('/movimentacaoFiltro', 'EventoController@movimentacaoFiltro');
    //     Route::post('/relatorioAtividadeFiltro', 'EventoController@relatorioAtividadeFiltro');
    //     Route::get('/relatorioAtividade', 'EventoController@relatorioAtividade');
    //     Route::get('/imprimirComprovante/{id}', 'EventoController@imprimirComprovante');
    //     Route::get('/registros/{id}', 'EventoController@registros');
    // });

    Route::group(['prefix' => '/locacao'], function () {
        Route::get('/itens/{id}', 'LocacaoController@itens')->name('locacao.itens');
        Route::post('/storeItem', 'LocacaoController@storeItem')->name('locacao.storeItem');
        Route::post('/storeObs', 'LocacaoController@storeObs')->name('locacao.storeObs');
        Route::get('/deleteItem/{id}', 'LocacaoController@deleteItem')->name('locacao.deleteItem');
        Route::get('/delete/{id}', 'LocacaoController@delete')->name('locacao.deletes');
        Route::get('/alterarStatus/{id}', 'LocacaoController@alterarStatus');
        Route::get('/comprovante/{id}', 'LocacaoController@comprovante');
        Route::get('/validaEstoque/{produto_id}/{locacao_id}', 'LocacaoController@validaEstoque')->name('locacao.validaEstoque');
    });

    Route::resource('locacao', 'LocacaoController');

    Route::group(['prefix' => '/dfe'], function () {
        Route::get('/novaConsulta', 'DfeController@novaconsulta')->name('dfe.novaConsulta');
        Route::get('/getDocumentosNovos', 'DfeController@getDocumentosNovos')->name('dfe.getDocumentosNovos');
        Route::post('/manifestar', 'DfeController@manifestar')->name('dfe.manifestar');
        Route::get('/danfe/{id}', 'DfeController@danfe')->name('dfe.danfe');
        Route::get('/download/{id}', 'DfeController@download')->name('dfe.download');
        Route::post('/storeFatura', 'DfeController@storeFatura')->name('dfe.storeFatura');
        Route::post('/storeCompra', 'DfeController@storeCompra')->name('dfe.storeCompra');
        Route::get('/downloadXml/{chave}', 'DfeController@downloadXml')->name('dfe.downloadXml');
        Route::get('/devolucao/{chave}', 'DfeController@devolucao')->name('dfe.devolucao');
    });

    Route::resource('dfe', 'DfeController');

    Route::group(['prefix' => '/relatorios'], function () {
        Route::get('/', 'RelatorioController@index')->name('relatorios.index');
        Route::get('/somaVendas', 'RelatorioController@somaVendas')->name('relatorios.soma-vendas');
        Route::get('/compras', 'RelatorioController@filtroCompras')->name('relatorios.compras');
        Route::get('/filtroVendas2', 'RelatorioController@filtroVendas2')->name('relatorios.vendas2');
        Route::get('/filtroVendaProdutos', 'RelatorioController@filtroVendaProdutos')->name('relatorios.filtroVendaProdutos');
        Route::get('/filtroVendaClientes', 'RelatorioController@filtroVendaClientes')->name('relatorios.vendaClientes');
        Route::get('/filtroEstoqueMinimo', 'RelatorioController@filtroEstoqueMinimo')->name('relatorios.filtroEstoqueMinimo');
        Route::get('/filtroVendaDiaria', 'RelatorioController@filtroVendaDiaria')->name('relatorios.vendaDiaria');
        Route::get('/filtroLucro', 'RelatorioController@filtroLucro')->name('relatorios.lucro');
        Route::get('/estoqueProduto', 'RelatorioController@estoqueProduto')->name('relatorios.estoqueProduto');
        Route::get('/comissaoVendas', 'RelatorioController@comissaoVendas')->name('relatorios.comissaoVendas');
        Route::get('/tiposPagamento', 'RelatorioController@tiposPagamento')->name('relatorios.tiposPagamento');
        Route::get('/cadastroProdutos', 'RelatorioController@cadastroProdutos')->name('relatorios.cadastroProduto');
        Route::get('/vendaDeProdutos', 'RelatorioController@vendaDeProdutos')->name('relatorios.vendaProdutos');
        Route::get('/listaPreco', 'RelatorioController@listaPreco')->name('relatorios.listaPreco');
        Route::get('/fiscal', 'RelatorioController@fiscal')->name('relatorios.fiscal');
        Route::get('/porCfop', 'RelatorioController@porCfop')->name('relatorios.porCfop');
        Route::get('/boletos', 'RelatorioController@boletos')->name('relatorios.boletos');
        Route::get('/clientes', 'RelatorioController@clientes')->name('relatorios.clientes');
    });


    Route::group(['prefix' => '/pedidosDelivery'], function () {
        Route::get('/', 'PedidoDeliveryController@today')->name('pedidosDelivery.today');
        Route::get('/verPedido/{id}', 'PedidoDeliveryController@verPedido');
        Route::get('/filtro', 'PedidoDeliveryController@filtro');
        Route::get('/alterarStatus/{id}', 'PedidoDeliveryController@alterarStatus');
        Route::get('/irParaFrenteCaixa/{id}', 'PedidoDeliveryController@irParaFrenteCaixa');
        Route::get('/alterarPedido', 'PedidoDeliveryController@alterarPedido');
        Route::get('/confirmarAlteracao', 'PedidoDeliveryController@confirmarAlteracao');
        Route::get('/print/{id}', 'PedidoDeliveryController@print');
        Route::get('/verCarrinhos', 'PedidoDeliveryController@verCarrinhos');
        Route::get('/verCarrinho/{id}', 'PedidoDeliveryController@verCarrinho');
        Route::get('/push/{id}', 'PedidoDeliveryController@push');
        Route::get('/emAberto', 'PedidoDeliveryController@emAberto');
        Route::post('/sendPush', 'PedidoDeliveryController@sendPush');
        Route::post('/sendPushWeb', 'PedidoDeliveryController@sendPushWeb');
        Route::post('/sendSms', 'PedidoDeliveryController@sendSms');
        //para frente de pedido
        Route::get('/frente', 'PedidoDeliveryController@frente')->name('pedidosDelivery.frente');
        Route::get('/frenteComPedido/{id}', 'PedidoDeliveryController@frenteComPedido')->name('pedidosDelivery.frenteComPedido');
        Route::get('/frenteComEndereco/{id}', 'PedidoDeliveryController@frenteComEndereco')->name('pedidosDelivery.frenteComEndereco');
        Route::get('/clientes', 'PedidoDeliveryController@clientes');
        Route::post('/abrirPedidoCaixa', 'PedidoDeliveryController@abrirPedidoCaixa');
        Route::post('/novoClienteDeliveryCaixa', 'PedidoDeliveryController@novoClienteDeliveryCaixa');
        Route::post('/novoEnderecoClienteCaixa', 'PedidoDeliveryController@novoEnderecoClienteCaixa');
        Route::post('/setEnderecoCaixa', 'PedidoDeliveryController@setEnderecoCaixa');
        Route::post('/getEnderecoCaixa/{cliente_id}', 'PedidoDeliveryController@getEnderecoCaixa');
        Route::post('/saveItemCaixa', 'PedidoDeliveryController@saveItemCaixa');
        Route::post('/store', 'PedidoDeliveryController@store')->name('pedidosDelivery.store');
        Route::get('/produtos', 'PedidoDeliveryController@produtos');
        Route::delete('/deleteItem/{id}', 'PedidoDeliveryController@deleteItem')->name('pedidosDelivery.deleteItem');
        Route::get('/getProdutoDelivery/{id}', 'PedidoDeliveryController@getProdutoDelivery');
        Route::post('/frenteComPedidoFinalizar', 'PedidoDeliveryController@frenteComPedidoFinalizar')->name('pedidosDelivery.frenteComPedidoFinalizar');
        Route::get('/removerCarrinho/{id}', 'PedidoDeliveryController@removerCarrinho');
    });


    Route::group(['prefix' => '/configMercado'], function () {
        Route::get('/', 'MercadoConfigController@index');
        Route::post('/save', 'MercadoConfigController@save');
    });

    Route::resource('categoriaDeLoja', 'CategoriaLojaController');
    Route::resource('categoriaDelivery', 'CategoriaProdutoDeliveryController');
    Route::resource('deliveryComplemento', 'DeliveryComplementoController');

    Route::group(['prefix' => 'produtoDelivery'], function () {
        //     Route::get('/', 'DeliveryConfigProdutoController@index');
        //     Route::get('/delete/{id}', 'DeliveryConfigProdutoController@delete');
        Route::get('/deleteImagem/{id}', 'ProdutoDeliveryController@deleteImagem');
        //     Route::get('/edit/{id}', 'DeliveryConfigProdutoController@edit');
        Route::get('/galeria/{id}', 'ProdutoDeliveryController@galeria')->name('produtoDelivery.galeria');
        Route::get('/push/{id}', 'ProdutoDeliveryController@push')->name('produtoDelivery.push');
        //     Route::get('/new', 'DeliveryConfigProdutoController@new');
        //     Route::get('/alterarDestaque/{id}', 'DeliveryConfigProdutoController@alterarDestaque');
        //     Route::get('/alterarStatus/{id}', 'DeliveryConfigProdutoController@alterarStatus');
        //     Route::post('/request', 'DeliveryConfigProdutoController@request');
        //     Route::post('/save', 'DeliveryConfigProdutoController@save');
        Route::post('/saveImagem', 'ProdutoDeliveryController@saveImagem')->name('produtoDelivery.saveImagem');
        //     Route::post('/update', 'DeliveryConfigProdutoController@update');
        //     Route::get('/pesquisa', 'DeliveryConfigProdutoController@pesquisa');
    });

    Route::resource('produtoDelivery', 'ProdutoDeliveryController');

    Route::group(['prefix' => 'configNF'], function () {
        Route::get('/certificados', 'ConfigNotaController@certificadosFresh');
        Route::get('/deleteCertificado', 'ConfigNotaController@deleteCertificado')->name('configNF.deleteCertificado');
        Route::get('/remove-logo', 'ConfigNotaController@removeLogo')->name('configNF.remove-logo');
        Route::get('/removeSenha/{id}', 'ConfigNotaController@removeSenha')->name('configNF.removeSenha');
        Route::get('/verificaSenha', 'ConfigNotaController@verificaSenha')->name('configNF.verificaSenha');
    });


    Route::resource('configNF', 'ConfigNotaController');

    Route::resource('suprimentoCaixa', 'SuprimentoCaixaController');
    Route::resource('cidades', 'CidadeController');

    Route::group(['prefix' => 'usuarios'], function () {
        Route::get('/historico/{id}', 'UsuarioController@historico')->name('usuarios.historico');
        Route::get('/set-location', 'UsuarioController@setLocation')->name('usuarios.set-location');
    });

    Route::group(['prefix' => 'produtos'], function () {
        Route::get('/getUnidadesMedida', 'ProductController@getUnidadesMedida')->name('produtos.getUnidadesMedida');
        Route::get('/movimentacao/{id}', 'ProductController@movimentacao')->name('produtos.movimentacao');
        Route::get('/movimentacao-print/{id}', 'ProductController@movimentacaoPrint')->name('movimentacao.print');
        Route::get('/duplicar/{id}', 'ProductController@duplicar')->name('produtos.duplicar');
        Route::get('/etiqueta/{id}', 'ProductController@etiqueta')->name('produtos.etiqueta');
        Route::post('/montaEtiqueta', 'ProductController@montaEtiqueta')->name('produtos.montaEtiqueta');
        Route::get('/exportacaoBalanca', 'ProductController@exportacaoBalanca')->name('produtos.exportacaoBalanca');
        Route::post('/exportacaoBalanca', 'ProductController@exportacaoBalancaFile')->name('produtos.exportacaoBalanca');
        Route::get('/set-estoque/{id}', 'StockController@setEstoqueLocais')->name('produtos.set-estoque');
    });

    Route::resource('usuarios', 'UsuarioController');

    Route::resource('categorias', 'CategoriaController');
    Route::resource('marcas', 'MarcaController');

    Route::resource('naturezas', 'NaturezaController');
    Route::resource('tributos', 'TributoController');
    Route::resource('escritorio', 'EscritorioController');
    Route::resource('fornecedores', 'ProviderController');
    Route::resource('transportadoras', 'TransportadoraController');
    Route::resource('categoria-servico', 'CategoriaServicoController');
    Route::resource('formasPagamento', 'FormaPagamentoController');
    Route::resource('categorias', 'CategoriaController');

    Route::resource('produtos', 'ProductController');

    Route::get('produtos-import', 'ProductController@import')->name('produtos.import');
    Route::get('produtos-download-modelo', 'ProductController@downloadModelo')->name('produtos.download-modelo');
    Route::post('produtos-import-store', 'ProductController@importStore')->name('produtos.import-store');

    Route::group(['prefix' => 'subcategorias'], function () {
        Route::get('/index/{id}', 'SubCategoriaController@index')->name('subcategoria.index');
        Route::delete('/{id}/destroy', 'SubCategoriaController@destroy')->name('subcategoria.destroy');
        Route::get('/{id}/edit', 'SubCategoriaController@edit')->name('subcategoria.edit');
        Route::get('/create/{categoria_id}', 'SubCategoriaController@create')->name('subcategoria.create');
        Route::post('/store/{id}', 'SubCategoriaController@store')->name('subcategoria.store');
        Route::put('/{id}/update', 'SubCategoriaController@update')->name('subcategoria.update');
    });

    Route::resource('gruposCliente', 'GrupoClienteController');
    Route::resource('acessores', 'AcessorController');
    Route::resource('divisaoGrade', 'DivisaoGradeController');


    Route::group(['prefix' => 'produtosComposto'], function () {
        Route::get('/create/{id}', 'ProductCompController@create')->name('produtosComposto.create');
        Route::get('/create_item/{id}', 'ProductCompController@createItem')->name('produtosComposto.create_item');
        Route::post('/store/{id}', 'ProductCompController@store')->name('produtosComposto.store');
        Route::post('/storeItem/{id}', 'ProductCompController@storeItem')->name('produtosComposto.storeItem');
    });

    Route::resource('contaBancaria', 'ContaBancariaController');




    Route::resource('categoria-conta', 'CategoriaContaController');

    Route::resource('conta-pagar', 'ContaPagarController');

    Route::group(['prefix' => 'contasPagar'], function () {
        Route::get('/{id}/pay', 'ContaPagarController@pay')->name('conta-pagar.pay');
        Route::put('/{id}/payPut', 'ContaPagarController@payPut')->name('conta-pagar.payPut');
    });

    Route::resource('conta-receber', 'ContaReceberController');

    Route::group(['prefix' => 'contasReceber'], function () {
        Route::get('/{id}/pay', 'ContaReceberController@pay')->name('conta-receber.pay');
        Route::put('/{id}/payPut', 'ContaReceberController@payPut')->name('conta-receber.payPut');
    });

    Route::group(['prefix' => 'receita'], function () {
        Route::post('/save', 'ReceitaController@save');
        Route::post('/update', 'ReceitaController@update');
        Route::post('/saveItem', 'ReceitaController@saveItem');
        Route::get('/deleteItem/{id}', 'ReceitaController@deleteItem');
    });

    Route::resource('vendasEmCredito', 'CreditoVendaController');
    Route::resource('funcionamentoDelivery', 'FuncionamentoDeliveryController');

    Route::group(['prefix' => 'funcionamentoDelivery'], function () {
        //     Route::get('/', 'FuncionamentoDeliveryController@index');
        //     Route::post('/save', 'FuncionamentoDeliveryController@save');
        //     Route::get('/edit/{id}', 'FuncionamentoDeliveryController@edit');
        Route::get('/alterarStatus/{id}', 'FuncionamentoDeliveryController@alterarStatus')
        ->name('funcionamentoDelivery.alterarStatus');
    });

    Route::resource('tributos', 'TributoController');
    Route::resource('sangriaCaixa', 'SangriaCaixaController');

    Route::group(['prefix' => 'caixa'], function () {
        //     Route::get('/', 'AberturaCaixaController@index');
        //     Route::get('/filtroUsuario', 'AberturaCaixaController@filtroUsuario');
        Route::get('/list', 'AberturaCaixaController@list')->name('caixa.list');
        Route::get('/detalhes/{id}', 'AberturaCaixaController@detalhes')->name('caixa.detalhes');
        Route::get('/imprimir/{id}', 'AberturaCaixaController@imprimir')->name('caixa.imprimir');
        Route::get('/imprimir80/{id}', 'AberturaCaixaController@imprimir80')->name('caixa.imprimir80');
        //     Route::get('/filtro', 'AberturaCaixaController@filtro');
        //     Route::group(['prefix' => 'aberturaCaixa'], function(){
        Route::get('/verificaHoje', 'AberturaCaixaController@verificaHoje')->name('caixa.verificaHoje');
        //     Route::post('/abrir', 'AberturaCaixaController@abrir');
        //     Route::get('/diaria', 'AberturaCaixaController@diaria');
    });

    Route::resource('caixa', 'AberturaCaixaController');

    Route::get('/app', 'PedidoRestController@apk');

    Route::group(['prefix' => 'contasReceber'], function () {
        Route::get('/{id}/pay', 'ContaReceberController@pay')->name('conta-receber.pay');
        Route::post('/receberSomente', 'ContaReceberController@receberSomente');
        Route::post('/receberComDivergencia', 'ContaReceberController@receberComDivergencia');
        Route::post('/receberComOutros', 'ContaReceberController@receberComOutros');
        Route::get(
            '/detalhes_venda/{conta_id}',
            'ContaReceberController@detalhesVenda'
        );
        Route::get('/pendentes', 'ContaReceberController@pendentes');
        Route::get('/filtroPendente', 'ContaReceberController@filtroPendente');
        Route::get('/receberMultiplos/{ids}', 'ContaReceberController@receberMultiplos');
        Route::post('/receberMulti', 'ContaReceberController@receberMulti');
    });

    Route::group(['prefix' => 'vendasCaixa'], function () {
        Route::post('/save', 'VendaCaixaController@save');
        Route::get('/diaria', 'VendaCaixaController@diaria');
        Route::get('/calcComissao', 'VendaCaixaController@calcComissao');
        Route::get('/pix', 'VendaCaixaController@gerarQrCode');
        Route::get('/consultaPix/{id}', 'VendaCaixaController@consultaPix');
    });

    // Route::group(['prefix' => 'funcionamentoDelivery'], function () {
    //     Route::get('/', 'FuncionamentoDeliveryController@index');
    //     Route::post('/save', 'FuncionamentoDeliveryController@save');
    //     Route::get('/edit/{id}', 'FuncionamentoDeliveryController@edit');
    //     Route::get('/alterarStatus/{id}', 'FuncionamentoDeliveryController@alterarStatus');
    // });

    Route::group(['prefix' => 'enviarXml'], function () {
        Route::get('/', 'EnviarXmlController@index')->name('enviarXml.index');
        Route::get('/filtro', 'EnviarXmlController@filtro')->name('enviarXml.filtro');
        Route::get('/download', 'EnviarXmlController@download');
        Route::get('/downloadNfce', 'EnviarXmlController@downloadNfce');
        Route::get('/downloadCte', 'EnviarXmlController@downloadCte');
        Route::get('/downloadMdfe', 'EnviarXmlController@downloadMdfe');
        Route::get('/downloadEntrada', 'EnviarXmlController@downloadEntrada');
        Route::get('/downloadDevolucao', 'EnviarXmlController@downloadDevolucao');
        Route::get('/email/{d1}/{d2}', 'EnviarXmlController@email');
        Route::get('/emailNfce/{d1}/{d2}', 'EnviarXmlController@emailNfce');
        Route::get('/emailCte/{d1}/{d2}', 'EnviarXmlController@emailCte');
        Route::get('/emailMdfe/{d1}/{d2}', 'EnviarXmlController@emailMdfe');
        Route::get('/emailEntrada/{d1}/{d2}', 'EnviarXmlController@emailEntrada');
        Route::get('/emailDevolucao/{d1}/{d2}', 'EnviarXmlController@emailDevolucao');
        Route::get('/send', 'EnviarXmlController@send');
        Route::get('/filtroCfop', 'EnviarXmlController@filtroCfop')->name('enviarXml.filtroCfop');
        Route::get('/filtroCfopGet', 'EnviarXmlController@filtroCfopGet')->name('enviarXml.filtroCfopGet');
        Route::get('/filtroCfopImprimir', 'EnviarXmlController@filtroCfopImprimir')->name('enviarXml.imprimir');
        Route::get('/filtroCfopImprimirGroup', 'EnviarXmlController@filtroCfopImprimirGroup')->name('enviarXml.imprimirGroup');

        Route::get('/downloadCompraFiscal', 'EnviarXmlController@downloadCompraFiscal');
        Route::get('/emailCompraFiscal/{d1}/{d2}', 'EnviarXmlController@emailCompraFiscal');
        
    });

    Route::group(['prefix' => 'cte'], function () {
        Route::get('/custos/{id}', 'CteController@custos')->name('cte.custos');
        Route::get('/manifesto', 'CteController@manifesto')->name('cte.manifesto');
        Route::get('/consultaDocumentos', 'EmiteCteController@consultaDocumentos')->name('cte.consultaDocumentos');
        Route::post('/storeReceita', 'CteController@storeReceita')->name('cte.storeReceita');
        Route::post('/storeDespesa/{id}', 'CteController@storeDespesa')->name('cte.storeDespesa');
        Route::get('/deleteDespesa/{id}', 'CteController@deleteDespesa')->name('cte.deleteDespesa');
        Route::get('/deleteReceita/{id}', 'CteController@deleteReceita')->name('cte.deleteReceita');
        Route::get('/detalhes/{id}', 'CteController@detalhes')->name('cte.detalhes');
        Route::get('/estadoFiscal/{id}', 'CteController@estadoFiscal')->name('cte.estadoFiscal');
        Route::post('/estadoFiscal', 'CteController@estadoFiscalStore')->name('cte.estadoFiscalStore');
        Route::post('/enviarXml', 'CteController@enviarXml')->name('cte.enviarXml');
        Route::get('/baixar-xml/{id}', 'CteController@baixarXml')->name('cte.baixar-xml');
        Route::post('/importarXml', 'CteController@importarXml')->name('cte.importarXml');
        Route::post('/salvarCte', 'CteController@salvarCte')->name('cte.salvarCte');
    });

    Route::resource('cte', 'CteController')->middleware('limiteCTe');

    Route::get('/cte-xml-temp/{id}', 'CteController@xmlTemp')->name('cte.xml-temp');
    Route::get('/cte-dacte-temp/{id}', 'CteController@dacteTemp')->name('cte.dacte-temp');
    Route::get('/cte/imprimir/{id}', 'CteController@imprimir')->name('cte.imprimir');
    Route::get('/cte/imprimir-cce/{id}', 'CteController@imprimirCCe')->name('cte.imprimir-cce');
    Route::get('/cte/imprimir-cancela/{id}', 'CteController@imprimirCancela')->name('cte.imprimir-cancela');

    Route::resource('cteOs', 'CteOsController');

    Route::group(['prefix' => 'cteOs'], function () {
        Route::get('/detalhes/{id}', 'CteOsController@detalhes')->name('cteOs.detalhes');
        Route::get('/estadoFiscal/{id}', 'CteOsController@estadoFiscal')->name('cteOs.estadoFiscal');
        Route::post('/estadoFiscal', 'CteOsController@estadoFiscalStore')->name('cteOs.estadoFiscalStore');
        Route::get('/xml-temp/{id}', 'CteOsController@xmlTemp')->name('cteOs.xml-temp');
        Route::get('/imprimir-cce/{id}', 'CteOsController@imprimirCCe')->name('cteOs.imprimir-cce');
        Route::get('/imprimir-cancela/{id}', 'CteOsController@imprimirCancela')->name('cteOs.imprimir-cancela');
        Route::post('/enviarXml', 'CteOsController@enviarXml')->name('cteOs.enviarXml');
        Route::get('/baixar-xml/{id}', 'CteOsController@baixarXml')->name('cteOs.baixar-xml');
    });

    Route::get('/mdfe-xml-temp/{id}', 'MdfeController@xmlTemp')->name('mdfe.xml-temp');
    Route::get('/mdfe/imprimir/{id}', 'MdfeController@imprimir')->name('mdfe.imprimir');
    Route::resource('mdfe', 'MdfeController')->middleware('limiteMDFe');

    Route::resource('sangriaCaixa', 'SangriaCaixaController');

    Route::group(['prefix' => 'nfce'], function () {
        //     Route::post('/gerar', 'NFCeController@gerar')->middleware('limiteNFCe');
        //     Route::get('/xmlTemp/{id}', 'NFCeController@xmlTemp');
        //     Route::get('/imprimir/{id}', 'NFCeController@imprimir');
        Route::get('/imprimirNaoFiscal/{id}', 'NfceController@imprimirNaoFiscal')->name('nfce.imprimirNaoFiscal');
        //     Route::get('/imprimirNaoFiscalCredito/{id}', 'NFCeController@imprimirNaoFiscalCredito');
        //     Route::post('/cancelar', 'NFCeController@cancelar');
        //     Route::get('/deleteVenda/{id}', 'NFCeController@deleteVenda');
        //     Route::get('/consultar/{id}', 'NFCeController@consultar');
        //     Route::get('/baixarXml/{id}', 'NFCeController@baixarXml');
        //     Route::get('/detalhes/{id}', 'NFCeController@detalhes');
        Route::get('/estadoFiscal/{id}', 'NfceController@estadoFiscal')->name('nfce.estadoFiscal');
        // Route::put('/estadoFiscal', 'NFCeController@estadoFiscalStore')->name('nfce.estadoFiscalStore');
        //     Route::get('/teste', 'NFCeController@teste');
        Route::post('/inutilizar', 'NfceController@inutilizar')->name('nfce.inutilizar');
        Route::get('/imprimirComprovanteAssessor/{id}', 'NfceController@imprimirComprovanteAssessor')->name('nfce.imprimirComprovanteAssessor');
    });


    Route::resource('nfce', 'NfceController')->middleware('limiteNFCe');

    Route::resource('clientes', 'ClienteController');
    Route::get('clientes-import', 'ClienteController@import')->name('clientes.import');
    Route::get('clientes-download-modelo', 'ClienteController@downloadModelo')->name('clientes.download-modelo');
    Route::post('clientes-import-store', 'ClienteController@importStore')->name('clientes.import-store');

    Route::resource('clientesDelivery', 'ClienteDeliveryController');

    Route::resource('enderecoDelivery', 'ClienteController');

    Route::group(['prefix' => 'clientesDelivery'], function () {
        //     Route::get('/', 'ClienteDeliveryController@index');
        //     Route::get('/edit/{id}', 'ClienteDeliveryController@edit');
        //     Route::get('/delete/{id}', 'ClienteDeliveryController@delete');
        //     Route::get('/all', 'ClienteDeliveryController@all');
        //     Route::post('/update', 'ClienteDeliveryController@update');
        //     Route::get('/pedidos/{id}', 'ClienteDeliveryController@pedidos');
        Route::get('/enderecos/{id}', 'ClienteDeliveryController@enderecos')->name('clientesDelivery.enderecos');
        //     Route::get('/enderecosEdit/{id}', 'ClienteDeliveryController@enderecoEdit');
        //     Route::get('/enderecosMap/{id}', 'ClienteDeliveryController@enderecosMap');
        //     Route::get('/favoritos/{id}', 'ClienteDeliveryController@favoritos');
        //     Route::get('/push/{id}', 'ClienteDeliveryController@push');
        //     Route::post('/updateEndereco', 'ClienteDeliveryController@updateEndereco');
        //     Route::get('/pesquisa', 'ClienteDeliveryController@pesquisa');
    });

    Route::group(['prefix' => 'compraFiscal'], function () {
        Route::get('/', 'CompraFiscalController@index')->name('compraFiscal.index');
        Route::post('/store', 'CompraFiscalController@store')->name('compraFiscal.store');

        Route::post('/import', 'CompraFiscalController@import')->name('compraFiscal.import');
        //     Route::post('/storeItem', 'CompraFiscalController@storeItem');
        //     Route::get('/read', 'CompraFiscalController@read');
        //     Route::get('/teste', 'CompraFiscalController@teste');
    });

    // Route::resource('compraFiscal', 'CompraFiscalController');

    Route::resource('compraManual', 'CompraManualController');

    Route::resource('funcionarios', 'FuncionarioController');
    Route::group(['prefix' => 'funcionarios'], function () {
        Route::get('comissao', 'FuncionarioController@comissao')->name('funcionarios.comissao');
    });

    Route::resource('funcionarios', 'FuncionarioController');

    Route::group(['prefix' => 'contatoFuncionario'], function () {
        Route::get('/{funcionaId}', 'FuncionarioController@index');
        Route::get('/delete/{id}', 'FuncionarioController@delete');
        Route::get('/edit/{id}', 'FuncionarioController@edit');
        Route::get('/new/{funcionarioId}', 'FuncionarioController@new');
        Route::post('/save', 'FuncionarioController@save');
        Route::post('/update', 'FuncionarioController@update');
    });

    Route::resource('servicos', 'ServiceController');

    Route::group(['prefix' => 'ordemServico'], function () {
        // Route::get('/', 'OrderController@index');
        // Route::get('/new', 'OrderController@new');
        // Route::get('/servicosordem/{id}', 'OrderController@servicosordem');
        Route::get('/deleteServico/{id}', 'OrderController@deleteServico')->name('ordemServico.deleteServico');
        Route::get('/deleteProduto/{id}', 'OrderController@deleteProduto')->name('ordemServico.deleteProduto');
        
        Route::get('/addRelatorio/{id}', 'OrderController@addRelatorio')->name('ordemServico.addRelatorio');
        Route::get('/editRelatorio/{id}', 'OrderController@editRelatorio')->name('ordemServico.editRelatorio');
        Route::get('/deleteRelatorio/{id}', 'OrderController@deleteRelatorio')->name('ordemServico.deleteRelatorio');
        Route::get('/alterarEstado/{id}', 'OrderController@alterarEstado')->name('ordemServico.alterarEstado');
        Route::post('/alterarEstadoPost', 'OrderController@alterarEstadoPost')->name('ordemServico.alterarEstadoPost');
        //Route::get('/filtro', 'OrderController@filtro');'
        Route::post('/storeRelatorio', 'OrderController@storeRelatorio')->name('ordemServico.storeRelatorio');
        Route::put('/upRelatorio', 'OrderController@upRelatorio')->name('ordemServico.upRelatorio');
        // Route::get('/cashFlowFilter', 'OrderController@cashFlowFilter');
        // Route::post('/save', 'OrderController@save');
        Route::post('/storeServico', 'OrderController@storeServico')->name('ordemServico.storeServico');
        Route::post('/storeProduto', 'OrderController@storeProduto')->name('ordemServico.storeProduto');
        // Route::post('/find', 'OrderController@find');
        // Route::get('/print/{id}', 'OrderController@print');
        Route::get('/deleteFuncionario/{id}', 'OrderController@deleteFuncionario')->name('ordemServico.deleteFuncionario');
        Route::post('/storeFuncionario', 'OrderController@storeFuncionario')->name('ordemServico.storeFuncionario');
        Route::get('/alterarStatusServico/{id}', 'OrderController@alterarStatusServico')->name('ordemServico.alterarStatusServico');
        Route::get('/imprimir/{id}', 'OrderController@imprimir')->name('ordemServico.imprimir');
        // Route::get('/delete/{id}', 'OrderController@delete')->name('ordemServico.delete');
        Route::delete('/delete/{id}', 'OrderController@destroy')->name('ordemServico.destroy');

        Route::get('/completa/{id}', 'OrderController@completa')->name('ordemServico.completa');
    });

    Route::resource('ordemServico', 'OrderController');

    Route::resource('fluxoCaixa', 'FluxoCaixaController');

    Route::group(['prefix' => 'vendas'], function () {
        Route::get('/clone/{id}', 'VendaController@clone')->name('vendas.clone');
        Route::get('/details/{id}', 'VendaController@details')->name('vendas.details');
        Route::get('/importacao', 'VendaController@importacao')->name('vendas.importacao');
        Route::post('/importacao', 'VendaController@importStore')->name('vendas.importacao');
        Route::get('/print/{id}', 'VendaController@print')->name('vendas.print');
        Route::get('/xml-temp/{id}', 'VendaController@xmlTemp')->name('vendas.xml-temp');
        Route::get('/danfe-temp/{id?}', 'VendaController@danfeTemp')->name('vendas.danfe-temp');
        Route::get('/state-fiscal/{id}', 'NfeController@estadoFiscal')->name('vendas.state-fiscal');
        Route::put('/clone-put/{id}', 'VendaController@clonarPut')->name('vendas.clone-put');
        Route::get('/carne', 'CarneController@index')->name('vendas.carne');
    });


    Route::group(['prefix' => 'nfe', 'middleware' => 'limiteNFe'], function () {
        Route::get('/imprimir/{id}', 'NfeController@imprimir')->name('nfe.imprimir');
        Route::get('/imprimir-cce/{id}', 'NfeController@imprimirCorrecao')->name('nfe.imprimir-cce');
        Route::get('/imprimir-cancela/{id}', 'NfeController@imprimirCancelamento')->name('nfe.imprimir-cancela');
        Route::get('/state-fiscal/{id}', 'NfeController@estadoFiscal')->name('nfe.state-fiscal');
        Route::put('/update-state/{id}', 'NfeController@updateState')->name('nfe.update-state');
        Route::get('/baixar-xml/{id}', 'NfeController@baixarXml')->name('nfe.baixar-xml');
        Route::post('/enviar-xml', 'NfeController@enviarXml')->name('nfe.enviar-xml');
    });


    Route::group(['prefix' => 'nfce'], function () {
        Route::get('/xml-temp/{id}', 'NfceController@xmlTemp')->name('nfce.xml-temp');
        Route::get('/imprimir/{id}', 'NfceController@imprimir')->name('nfce.imprimir');
        Route::get('/baixar-xml/{id}', 'NfceController@baixarXml')->name('nfce.baixar-xml');
        Route::get('/state-fiscal/{id}', 'NfceController@estadoFiscal')->name('nfce.state-fiscal');
        Route::put('/update-state/{id}', 'NfceController@updateState')->name('nfce.update-state');
    });


    Route::group(['prefix' => 'nferemessa'], function () {
        Route::get('/gerarXml/{id}', 'NfeRemessaXmlController@gerarXml')->name('nferemessa.gerarXml');
        Route::get('/danfe-temp/{id?}', 'NfeRemessaXmlController@danfeTemp')->name('nferemessa.danfe-temp');
        Route::get('/xml-temp/{id}', 'NfeRemessaXmlController@xmlTemp')->name('nferemessa.xml-temp');
        Route::get('/state-fiscal/{id}', 'NfeRemessaController@estadoFiscal')->name('nferemessa.state-fiscal');
        Route::put('/update-state/{id}', 'NfeRemessaController@updateState')->name('nferemessa.update-state');
        Route::get('/imprimir/{id}', 'NfeRemessaXmlController@imprimir')->name('nferemessa.imprimir');
        Route::get('/baixar-xml/{id}', 'NfeRemessaXmlController@baixarXml')->name('nferemessa.baixar-xml');
        Route::post('/enviar-xml', 'NfeRemessaController@enviarXml')->name('nferemessa.enviar-xml');
        Route::get('/imprimir-cce/{id}', 'NfeRemessaController@imprimirCorrecao')->name('nferemessa.imprimir-cce');
        Route::get('/imprimir-cancela/{id}', 'NfeRemessaController@imprimirCancelamento')->name('nferemessa.imprimir-cancela');
    });

    Route::resource('nferemessa', 'NfeRemessaController');

    Route::resource('vendas', 'VendaController');
    Route::resource('compras', 'PurchaseController');
    Route::get('/compras-nfe-entrada/{id}', 'PurchaseController@nfeEntrada')->name('compras.nfe-entrada');
    Route::put('/compras-set-natureza/{id}', 'PurchaseController@setNatureza')->name('compras.set-natureza');
    Route::get('/compras-xml-temp/{id}', 'PurchaseController@xmlTemp')->name('compras.xml-temp');
    Route::get('/compras-danfe-temp/{id}', 'PurchaseController@danfeTemp')->name('compras.danfe-temp');
    Route::get('/compras-danfe/{id}', 'PurchaseController@danfe')->name('compras.imprimir-danfe');
    Route::get('/compras-imprimir-cce/{id}', 'PurchaseController@imprimirCorrecao')->name('compras.imprimir-cce');
    Route::get('/compras-imprimir-cancela/{id}', 'PurchaseController@imprimirCancelamento')->name('compras.imprimir-cancela');

    Route::group(['prefix' => 'inventario'], function () {
        // Route::get('/', 'InventarioController@index');
        // Route::get('/new', 'InventarioController@new');
        // Route::post('/save', 'InventarioController@save');
        // Route::get('/edit/{id}', 'InventarioController@edit');
        // Route::get('/delete/{id}', 'InventarioController@delete');
        // Route::get('/alterarStatus/{id}', 'InventarioController@alterarStatus');
        // Route::post('/update', 'InventarioController@update');
        // Route::get('/filtro', 'InventarioController@filtro');
        Route::get('/apontar/{id}', 'InventarioController@apontar')->name('inventario.apontar');
        Route::get('/itens/{id}', 'InventarioController@itens')->name('inventario.itens');
        Route::post('/storeApontamento', 'InventarioController@storeApontamento')->name('inventario.storeApontamento');
        //    Route::get('/itensDelete/{id}', 'InventarioController@itensDelete');
        Route::get('/print/{id}', 'InventarioController@print')->name('inventario.print');
        Route::delete('/destroy-item/{id}', 'InventarioController@destroyItem')->name('inventario.destroy-item');
    });

    Route::resource('inventario', 'InventarioController');

    Route::group(['prefix' => 'estoque'], function () {
        Route::get('/apontamentoManual', 'StockController@manual')->name('estoque.apontamentoManual');
        Route::get('/listaApontamento', 'StockController@listaApontamento')->name('estoque.listaApontamento');
        Route::get('/apontamento', 'StockController@destroy')->name('estoque.apontamentoDestroy');
        Route::get('/apontamentoProducao', 'StockController@apontamentoProducao')->name('estoque.apontamentoProducao');
        Route::get('/todosApontamentos', 'StockController@todosApontamentos')->name('estoque.todosApontamentos');
        Route::get('/storeApontamento', 'StockController@storeApontamento')->name('estoque.storeApontamento');
        Route::post('/set-estoque-local', 'StockController@setEstoqueStore')->name('estoque.set-estoque-local');
        //Route::get('/movimentacao/{id}', 'StockController@movimentacao')->name('estoque.movimentacao');
    });

    Route::resource('estoque', 'StockController');

    Route::get('/response/{code}', 'CotacaoResponseController@response');
    Route::get('/finish', 'CotacaoResponseController@finish')->name('catacao.finish');
    Route::post('/store', 'CotacaoResponseController@store')->name('catacaoResponse.store');

    Route::group(['prefix' => 'cotacao'], function () {
        Route::get('/listaPorReferencia', 'CotacaoController@referencia')->name('cotacao.referencia');
        Route::get('/destroyItem', 'CotacaoController@destroyItem')->name('cotacao.destroyItem');
        Route::get('/sendMail/{id}', 'CotacaoController@sendMail')->name('cotacao.sendMail');
        Route::get('/alterarStatus/{id}/{status}', 'CotacaoController@alterarStatus')->name('cotacao.alterarStatus');

		// Route::get('/response/{code}', 'CotacaoController@response')->name('cotacao.response');

        // Route::get('/response/{code}', 'CotacaoController@response')->name('cotacao.response');

        Route::get('/referenciaView/{referencia}', 'CotacaoController@referenciaView')->name('cotacao.referenciaView');
        Route::get('/view/{id}', 'CotacaoController@view')->name('cotacao.view');
        Route::get('/clonar/{id}', 'CotacaoController@clonar')->name('cotacao.clonar');
        Route::post('/clonarSave', 'CotacaoController@clonarSave')->name('cotacao.clonarSave');
        Route::get('/escolher/{id}', 'CotacaoController@escolher')->name('cotacao.escolher');
        Route::get('/imprimirMelhorResultado', 'CotacaoController@imprimirMelhorResultado')->name('cotacao.imprimirMelhorResultado');
    });

    Route::resource('cotacao', 'CotacaoController');

    Route::group(['prefix' => 'pedidos'], function () {
        Route::post('/abrir', 'PedidoController@abrir')->name('pedidos.abrir');
        Route::post('/storeItem', 'PedidoController@storeItem')->name('pedidos.storeItem');
        Route::post('/storeCliente', 'PedidoController@storeCliente')->name('pedidos.storeCliente');
        Route::get('/verMesa/{id}', 'PedidoController@verMesa')->name('pedidos.verMesa');
        Route::get('/deleteItem/{id}', 'PedidoController@deleteItem')->name('pedidos.deleteItem');
        Route::get('/alterarStatus/{id}', 'PedidoController@alterarStatus')->name('pedidos.alterarStatus');
        Route::get('/finalizar/{id}', 'PedidoController@finalizar')->name('pedidos.finalizar');
        Route::get('/imprimirPedido/{id}', 'PedidoController@imprimirPedido')->name('pedidos.imprimirPedido');
        Route::get('/mesas', 'PedidoController@mesas')->name('pedidos.mesas');
        Route::post('/atribuirMesa', 'PedidoController@atribuirMesa')->name('pedidos.atribuirMesa');
        Route::get('/desativar/{id}', 'PedidoController@desativar')->name('pedidos.desativar');
        Route::get('/imprimirItens', 'PedidoController@imprimirItens')->name('pedidos.imprimirItens');
        Route::get('/itensParaFrenteCaixa', 'PedidoController@itensParaFrenteCaixa')->name('pedidos.itensParaFrenteCaixa');
        Route::get('/controleComandas', 'PedidoController@controleComandas')->name('pedidos.controleComandas');
        Route::get('/verDetalhes/{id}', 'PedidoController@verDetalhes')->name('pedidos.verDetalhes');

        Route::get('/upload', 'PedidoController@upload')->name('pedidos.upload');
        Route::post('/apk', 'PedidoController@apkUpload')->name('pedidos.upload-store');
        Route::get('/download', 'PedidoController@download');
        Route::get('/download_generic', 'PedidoController@download_generic');
    });

    Route::resource('pedidos', 'PedidoController');

    Route::resource('telasPedido', 'TelaPedidoController');

    Route::group(['prefix' => 'mesas'], function () {
        Route::get('/gerarQrCode', 'MesaController@gerarQrCode')->name('mesas.gerarQrCode');
        Route::get('/issue/{id}', 'MesaController@issue');
        Route::get('/issue2/{id}', 'MesaController@issue2');
        Route::get('/imprimirQrCode', 'MesaController@imprimirQrCode');
        Route::get('/delete/{id}', 'MesaController@delete')->name('mesas.delete');
    });

    Route::resource('mesas', 'MesaController');

    Route::group(['prefix' => 'frenteCaixa'], function () {
        Route::get('/list', 'FrontBoxController@list')->name('frenteCaixa.list');
        Route::get('/imprimir-nao-fiscal/{id}', 'FrontBoxController@imprimirNaoFiscal')->name('frenteCaixa.imprimir-nao-fiscal');
        Route::get('/devolucao', 'FrontBoxController@devolucao')->name('frenteCaixa.devolucao');
        Route::get('/troca', 'FrontBoxController@troca')->name('frenteCaixa.troca');
        Route::get('/fechar', 'FrontBoxController@fecharCaixa')->name('frenteCaixa.fechar');
        Route::post('/fechar', 'FrontBoxController@fecharPost')->name('frenteCaixa.fecharPost');
        Route::get('/config', 'FrontBoxController@configuracao')->name('frenteCaixa.configuracao');
        Route::post('/storeConfig', 'FrontBoxController@storeConfig')->name('frenteCaixa.storeConfig');
        Route::get('/storeConfig', 'FrontBoxController@storeConfig')->name('frenteCaixa.storeConfig');
    });

    Route::resource('frenteCaixa', 'FrontBoxController');
    Route::resource('preVenda', 'PreVendaController');

    Route::group(['prefix' => 'clienteDelivery'], function () {
        Route::get('/all', 'AppUserController@all');
    });

    Route::resource('push', 'PushController');

    Route::resource('codigoDesconto', 'CodigoDescontoController');

    Route::resource('tamanhosPizza', 'TamanhoPizzaController');

    Route::resource('categoriaDespesa', 'CategoriaDespesaController');

    Route::resource('veiculos', 'VeiculoController');

    Route::group(['prefix' => 'devolucao'], function () {
        Route::get('/estadoFiscal/{id}', 'DevolucaoController@estadoFiscal')->name('devolucao.estadoFiscal');
        Route::post('/estadoFiscal', 'DevolucaoController@estadoFiscalStore')->name('devolucao.estadoFiscalStore');
    });

    Route::resource('devolucao', 'DevolucaoController');
    Route::get('devolucao/xml-temp/{id}', 'DevolucaoController@xmlTemp');
    Route::get('devolucao/danfe-temp/{id}', 'DevolucaoController@danfeTemp');
    Route::get('devolucao/imprimir/{id}', 'DevolucaoController@imprimir');
    Route::get('devolucao/imprimir-cce/{id}', 'DevolucaoController@imprimirCorrecao');
    Route::get('devolucao/imprimir-cancela/{id}', 'DevolucaoController@imprimirCancelamento');

    Route::post('devolucao-xml', 'DevolucaoController@viewXml')->name('devolucao.view-xml');

    Route::group(['prefix' => 'controleCozinha'], function () {
        Route::get('/', 'CozinhaController@index')->name('controleCozinha.index');
        Route::get('/buscar', 'CozinhaController@buscar');
        Route::get('/concluido', 'CozinhaController@concluido');
        Route::get('/controle/{tela?}', 'CozinhaController@index')->name('controleCozinha.controle');
        Route::get('/selecionar', 'CozinhaController@selecionar')->name('controleCozinha.selecionar');
    });

    Route::group(['prefix' => 'controleCozinha'], function () {
        Route::get('/buscar', 'CozinhaController@buscar');
        Route::get('/concluido', 'CozinhaController@concluido');
    });


    Route::get('/graficos', 'HomeController@index')->name('graficos.index');

    Route::group(['prefix' => 'graficos'], function () {
        Route::get('/faturamentoDosUltimosSeteDias', 'HomeController@faturamentoDosUltimosSeteDias');
        Route::get('/faturamentoFiltrado', 'HomeController@faturamentoFiltrado');
        Route::get('/boxConsulta/{dias}', 'HomeController@boxConsulta');
    });

    Route::group(['prefix' => 'bairrosDeliveryLoja'], function () {
        Route::get('/herdar', 'BairroDeliveryLojaController@herdar')->name('bairrosDeliveryLoja.herdar');
        //     Route::get('/delete/{id}', 'BairroDeliveryController@delete');
        //     Route::get('/edit/{id}', 'BairroDeliveryController@edit');
        //     Route::get('/new', 'BairroDeliveryController@new');
        //     Route::post('/request', 'BairroDeliveryController@request');
        //     Route::post('/save', 'BairroDeliveryController@save');
        //     Route::post('/update', 'BairroDeliveryController@update');
    });

    Route::resource('bairrosDelivery', 'BairroDeliveryController');

    Route::resource('bairrosDeliveryLoja', 'BairroDeliveryLojaController');

    Route::resource('carrosselDelivery', 'CarroselDeliveryController');

    Route::group(['prefix' => '/carrosselDelivery'], function () {
        Route::get('/delete/{id}', 'CarroselDeliveryController@delete')->name('carrosselDelivery.delete');
        Route::get('/down/{id}', 'CarroselDeliveryController@down')->name('carrosselDelivery.down');
        Route::get('/up/{id}', 'CarroselDeliveryController@up')->name('carrosselDelivery.up');
        Route::get('/alteraStatus/{id}', 'CarroselDeliveryController@alteraStatus')->name('carrosselDelivery.alterarStatus');
    });

    Route::resource('cidadeDelivery', 'CidadeDeliveryController');


    Route::group(['prefix' => 'categoriasParaDestaque'], function () {
        Route::get('/', 'DestaqueDeliveryMasterController@indexCategoria')->name('categoriasParaDestaque.indexCategoria');
        Route::delete('/destroy/{id}', 'DestaqueDeliveryMasterController@destroyCategoria')->name('categoriasParaDestaque.destroyCategoria');
        Route::get('/edit/{id}', 'DestaqueDeliveryMasterController@editCategoria')->name('categoriasParaDestaque.editCategoria');
        Route::get('/create', 'DestaqueDeliveryMasterController@createCategoria')->name('categoriasParaDestaque.createCategoria');
        Route::post('/store', 'DestaqueDeliveryMasterController@storeCategoria')->name('categoriasParaDestaque.storeCategoria');
        Route::put('/update/{id}', 'DestaqueDeliveryMasterController@updateCategoria')->name('categoriasParaDestaque.updateCategoria');
    });

    Route::resource('produtosDestaque', 'DestaqueDeliveryMasterController');

    Route::resource('categoriaMasterDelivery', 'CategoriaMasterDeliveryController');

    Route::group(['prefix' => 'orcamentoVenda'], function () {
        Route::post('/gerarPagamentos', 'OrcamentoController@gerarPagamentos')->name('orcamentoVenda.gerarPagamentos');
        Route::get('/destroyParcela/{id}', 'OrcamentoController@destroyParcela')->name('orcamentoVenda.destroyParcela');
        Route::get('/destroyItem/{id}', 'OrcamentoController@destroyItem')->name('orcamentoVenda.destroyItem');
        Route::post('/addPagamentos', 'OrcamentoController@addPagamentos')->name('orcamentoVenda.addPagamentos');
        Route::post('/addItem', 'OrcamentoController@addItem')->name('orcamentoVenda.addItem');
        Route::get('/imprimir/{id}', 'OrcamentoController@imprimir')->name('orcamentoVenda.imprimir');
        Route::get('/reprovar/{id}', 'OrcamentoController@reprovar')->name('orcamentoVenda.reprovar');
        Route::get('/enviarEmail', 'OrcamentoController@enviarEmail')->name('orcamentoVenda.enviarEmail');
        Route::get('/rederizarDanfe/{id}', 'OrcamentoController@rederizarDanfe')->name('orcamentoVenda.rederizarDanfe');
        Route::get('/relatorioItens/{data1}/{data2}', 'OrcamentoController@relatorioItens')->name('orcamentoVenda.relatorioItens');
    });

    Route::resource('orcamentoVenda', 'OrcamentoController');

    // Route::group(['prefix' => 'percentualuf'], function () {
    //     Route::get('/', 'PercentualController@index');
    //     Route::get('/novo/{uf}', 'PercentualController@novo');
    //     Route::get('/edit/{uf}', 'PercentualController@edit');
    //     Route::post('/save', 'PercentualController@save');
    //     Route::post('/update', 'PercentualController@update');
    //     Route::get('/verProdutos/{uf}', 'PercentualController@verProdutos');
    //     Route::get('/editPercentual/{id}', 'PercentualController@editPercentual');
    //     Route::post('/updatePercentualSingle', 'PercentualController@updatePercentualSingle');
    // });



    Route::group(['prefix' => 'listaDePrecos'], function () {
        //    Route::get('/', 'ListaPrecoController@index');
        //    Route::get('/delete/{id}', 'ListaPrecoController@delete');
        //    Route::get('/edit/{id}', 'ListaPrecoController@edit');
        //    Route::get('/new', 'ListaPrecoController@new');
        Route::post('/storeValor', 'ListaPrecoController@storeValor')->name('listaDePrecos.storeValor');
        //    Route::post('/update', 'ListaPrecoController@update');
        //    Route::get('/ver/{id}', 'ListaPrecoController@ver');
        Route::get('/gerar/{id}', 'ListaPrecoController@gerar')->name('listaDePrecos.gerar');
        Route::get('/editValor/{id}', 'ListaPrecoController@editValor')->name('listaDePrecos.editarValor');
        //    Route::post('/salvarPreco', 'ListaPrecoController@salvarPreco');
        Route::get('/pesquisa', 'ListaPrecoController@pesquisa')->name('listaDeprecos.pesquisa');
        Route::get('/filtro', 'ListaPrecoController@filtro')->name('listaDePrecos.filtro');
    });


    Route::resource('listaDePrecos', 'ListaPrecoController');


    Route::group(['prefix' => 'pedido', 'middleware' => ['pedidoAtivo']], function () {
        Route::get('/', 'PedidoQrCodeController@index');
        Route::get('/open/{id}', 'PedidoQrCodeController@open');
        Route::get('/erro', 'PedidoQrCodeController@erro');
        Route::get('/cardapio/{id}', 'PedidoQrCodeController@cardapio');
        Route::get('/escolherSabores', 'PedidoQrCodeController@escolherSabores');
        Route::post('/adicionarSabor', 'PedidoQrCodeController@adicionarSabor');
        Route::get('/verificaPizzaAdicionada', 'PedidoQrCodeController@verificaPizzaAdicionada');
        Route::get('/removeSabor/{id}', 'PedidoQrCodeController@removeSabor');
        Route::get('/adicionais/{id}', 'PedidoQrCodeController@adicionais');
        Route::get('/adicionaisPizza', 'PedidoQrCodeController@adicionaisPizza');
        Route::get('/pesquisa', 'PedidoQrCodeController@pesquisa');
        Route::get('/pizzas', 'DeliveryController@pizzas');
        Route::get('/ver', 'PedidoQrCodeController@ver');
        Route::post('/addPizza', 'PedidoQrCodeController@addPizza')->middleware('mesaAtiva');
        Route::post('/addProd', 'PedidoQrCodeController@addProd')->middleware('mesaAtiva');
        Route::get('/refreshItem/{id}/{quantidade}', 'PedidoQrCodeController@refreshItem');
        Route::get('/removeItem/{id}', 'PedidoQrCodeController@removeItem');
        Route::get('/finalizar', 'PedidoQrCodeController@finalizar');
    });

    Route::group(['prefix' => 'configEcommerce'], function () {
        //    Route::get('/', 'ConfigEcommerceController@index');
        //    Route::post('/save', 'ConfigEcommerceController@save');
        Route::get('/verSite', 'ConfigEcommerceController@verSite')->name('configEcommerce.verSite');
    });

    Route::resource('configEcommerce', 'ConfigEcommerceController');
    Route::resource('categoriaEcommerce', 'CategoriaProdutoEcommerceController');
    Route::resource('clienteEcommerce', 'ClienteEcommerceController');

    Route::group(['prefix' => 'produtoEcommerce'], function () {
        Route::get('/galeria/{id}', 'ProdutoEcommerceController@galeria')->name('produtoEcommerce.galeria');
        Route::post('/saveImagem', 'ProdutoEcommerceController@saveImagem')->name('produtoEcommerce.saveImagem');
        Route::get('/deleteImagem/{id}', 'ProdutoEcommerceController@deleteImagem');
    });

    Route::resource('produtoEcommerce', 'ProdutoEcommerceController');

    Route::resource('videos', 'VideoController');

    Route::group(['prefix' => 'subCategoriaEcommerce'], function () {
        Route::get('/index/{id}', 'SubCategoriaEcommerceController@index')->name('subCategoriaEcommerce.index');
        Route::delete('/{id}/destroy', 'SubCategoriaEcommerceController@destroy')->name('subCategoriaEcommerce.destroy');
        Route::get('/{id}/edit', 'SubCategoriaEcommerceController@edit')->name('subCategoriaEcommerce.edit');
        Route::get('/create/{categoria_id}', 'SubCategoriaEcommerceController@create')->name('subCategoriaEcommerce.create');
        Route::post('/store/{id}', 'SubCategoriaEcommerceController@store')->name('subCategoriaEcommerce.store');
        Route::put('/{id}/update', 'SubCategoriaEcommerceController@update')->name('subCategoriaEcommerce.update');
    });

    Route::group(['prefix' => 'enderecosEcommerce'], function () {
        Route::get('/{cliente_id}', 'EnderecosEcommerceController@index')->name('enderecosEcommerce.index');
        Route::get('/edit/{id}', 'EnderecosEcommerceController@edit');
        Route::post('/update', 'EnderecosEcommerceController@update');
    });


    Route::resource('pedidosEcommerce', 'PedidoEcommerceController');
    Route::resource('carrosselEcommerce', 'CarrosselEcommerceController');
    Route::resource('autorPost', 'AutorPostController');
    Route::resource('categoriaPosts', 'CategoriaPostsController');
    Route::resource('postBlog', 'PostBlogController');
    Route::resource('contatoEcommerce', 'ContatoEcommerceController');
    Route::resource('informativoEcommerce', 'InformativoController');

    Route::group(['prefix' => 'tickets'], function () {
        //     Route::get('/', 'TicketController@index');
        //     Route::get('/new', 'TicketController@new');
        //     Route::get('/view/{id}', 'TicketController@view');
        Route::get('/finalizar/{id}', 'TicketController@finalizar')->name('tickes.finalizar');
        //     Route::post('/save', 'TicketController@save');
        Route::post('/novaMensagem', 'TicketController@novaMensagem')->name('tickets.novaMensagem');
        Route::post('/finalizar', 'TicketController@finalizarPost')->name('tickets.finalizar');
    });

    Route::resource('tickets', 'TicketController');
    Route::get('/nuvemshop-authorize', 'NuvemShopAuthController@index')->name('nuvemshop-auth.authorize');
    Route::get('/nuvemshop-auth', 'NuvemShopAuthController@auth')->name('nuvemshop-auth.auth');
    Route::resource('nuvemshop', 'NuvemShopController');
    Route::resource('nuvemshop-categoria', 'NuvemShopCategoriaController');
    Route::resource('nuvemshop-pedidos', 'NuvemShopPedidoController');
    Route::get('/nuvemshop-pedidos-print/{id}', 'NuvemShopPedidoController@print')->name('nuvemshop-pedidos.print');
    Route::get('/nuvemshop-pedidos-nfe/{id}', 'NuvemShopPedidoController@nfe')->name('nuvemshop-pedidos.nfe');
    Route::put('/nuvemshop-pedidos-store-venda/{id}', 'NuvemShopPedidoController@storeVenda')->name('nuvemshop-pedidos.store-venda');

    Route::resource('nuvemshop-produtos', 'NuvemShopProdutoController');
    Route::resource('nuvemshop-clientes', 'NuvemShopClienteController');
    Route::get('/nuvemshop-produtos-galery/{id}', 'NuvemShopProdutoController@galery')->name('nuvemshop-produtos.galery');
    Route::put('/nuvemshop-produtos-galery/{id}', 'NuvemShopProdutoController@saveImage')->name('nuvemshop-produtos.storeImagem');
    Route::delete('/nuvemshop-destroy-image/{id}', 'NuvemShopProdutoController@destroyImage')->name('nuvemshop-produtos.destroy_image');

    Route::get('/nuvemshop-auth', 'NuvemShopAuthController@auth');

    // Route::group(['prefix' => 'nuvemshop'], function () {
    //     Route::get('/', 'NuvemShopAuthController@index');
    //     Route::get('/auth', 'NuvemShopAuthController@auth');
    //     Route::get('/app', 'NuvemShopAuthController@app');
    //     Route::get('/config', 'NuvemShopController@config');
    //     Route::post('/save', 'NuvemShopController@save');
    //     Route::get('/categorias', 'NuvemShopController@categorias');
    //     Route::get('/categoria_new', 'NuvemShopController@categoria_new');
    //     Route::get('/categoria_edit/{id_shop}', 'NuvemShopController@categoria_edit');
    //     Route::get('/categoria_delete/{id_shop}', 'NuvemShopController@categoria_delete');
    //     Route::post('/saveCategoria', 'NuvemShopController@saveCategoria');
    //     Route::get('/produtos', 'NuvemShopProdutoController@index');
    //     Route::get('/produto_new', 'NuvemShopProdutoController@produto_new');
    //     Route::get('/produto_edit/{id_shop}', 'NuvemShopProdutoController@produto_edit');
    //     Route::get('/produto_delete/{id_shop}', 'NuvemShopProdutoController@produto_delete');
    //     Route::get('/produto_galeria/{id_shop}', 'NuvemShopProdutoController@produto_galeria');
    //     Route::get('/delete_imagem/{produto_id}/{img_id}', 'NuvemShopProdutoController@delete_imagem');
    //     Route::post('/save_imagem', 'NuvemShopProdutoController@save_imagem');
    //     Route::post('/saveProduto', 'NuvemShopProdutoController@saveProduto');
    //     Route::get('/pedidos', 'NuvemShopPedidoController@index');
    //     Route::get('/filtro', 'NuvemShopPedidoController@filtro');
    //     Route::get('/detalhar/{id}', 'NuvemShopPedidoController@detalhar');
    //     Route::get('/clientes', 'NuvemShopPedidoController@clientes');
    //     Route::get('/imprimir/{id}', 'NuvemShopPedidoController@imprimir');
    //     Route::get('/gerarNFe/{id}', 'NuvemShopPedidoController@gerarNFe');
    //     Route::post('/storeVenda', 'NuvemShopPedidoController@storeVenda');
    // });
});

Route::group(['prefix' => 'loja', 'middleware' => 'validaEcommerce'], function () {
    Route::get('/{link}', 'EcommerceController@index');
    Route::get('/{link}/categorias', 'EcommerceController@categorias');
    Route::get('/{link}/{id}/categorias', 'EcommerceController@produtosDaCategoria');
    Route::get('/{link}/{id}/subcategoria', 'EcommerceController@produtosDaSubCategoria');
    //blog
    Route::get('/{link}/blog', 'EcommerceController@blog');
    Route::get('/{link}/contato', 'EcommerceController@contato');
    Route::get('/{link}/{id}/verPost', 'EcommerceController@verPost');
    Route::get('/{link}/{id}/verProduto', 'EcommerceController@verProduto');
    Route::post('/{link}/addProduto', 'EcommerceController@addProduto');
    Route::get('/{link}/carrinho', 'EcommerceController@carrinho');
    Route::get('/{link}/curtidas', 'EcommerceController@curtidas');
    Route::get('/{link}/{id}/deleteItemCarrinho', 'EcommerceController@deleteItemCarrinho');
    Route::get('/{link}/{id}/deleteItemCarrinho', 'EcommerceController@deleteItemCarrinho');
    Route::get('/{link}/carrinho/atualizaItem', 'EcommerceController@atualizaItem');
    Route::get('/{link}/checkout', 'EcommerceController@checkout');
    Route::post('/{link}/checkout', 'EcommerceController@checkoutStore');
    Route::get('/{link}/logoff', 'EcommerceController@logoff');
    Route::get('/{link}/login', 'EcommerceController@login');
    Route::post('/{link}/login', 'EcommerceController@loginPost');
    Route::post('/{link}/pagamento', 'EcommerceController@pagamento');
    // Route::get('/{link}/pagamento', 'EcommerceController@pagamento');
    Route::get('/{link}/endereco', 'EcommerceController@endereco');
    Route::get('/{link}/esquecisenha', 'EcommerceController@esquecisenha');
    Route::post('/{link}/esquecisenha', 'EcommerceController@esquecisenhaPost');
    Route::get('/{link}/{id}/curtirProduto', 'EcommerceController@curtirProduto');
    Route::get('/{link}/pedido_detalhe/{id}', 'EcommerceController@pedidoDetalhe');
    Route::get('/{link}/pesquisa', 'EcommerceController@pesquisa');
});

Route::post('/ecommerceContato', 'EcommerceController@saveContato');
Route::post('/ecommerceInformativo', 'EcommerceController@saveInformativo');
Route::get('/ecommerceCalculaFrete', 'EcommerceController@calculaFrete');
Route::post('/ecommerceSetaFrete', 'EcommerceController@setaFrete');
Route::post('/ecommerceUpdateCliente', 'EcommerceController@ecommerceUpdateCliente');
Route::post('/ecommerceUpdateSenha', 'EcommerceController@ecommerceUpdateSenha');
Route::post('/ecommerceSaveEndereco', 'EcommerceController@ecommerceSaveEndereco');

Route::group(['prefix' => 'ecommercePay'], function () {
    Route::post('/boleto', 'EcommercePayController@paymentBoleto');
    Route::post('/pix', 'EcommercePayController@paymentPix');
    Route::post('/cartao', 'EcommercePayController@paymentCartao');
    Route::get('/consulta/{transacao_id}', 'EcommercePayController@consultaPagamento');
    Route::get('/finalizado/{hash}', 'EcommercePayController@finalizado');
});

Route::get('lojainexistente', function () {
    return view('lojainexistente');
});

Route::get('/habilitadoApi', function () {
    return view('habilitadoApi');
});
