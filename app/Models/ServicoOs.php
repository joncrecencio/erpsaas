<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ServicoOs extends Model
{
    protected $fillable = [
    	'servico_id', 'ordem_servico_id', 'quantidade', 'status', 'valor_unitario', 'sub_total'
    ];

    public function servico(){
        return $this->belongsTo(Servico::class, 'servico_id');
    }

    public function ordemServico(){
        return $this->belongsTo(OrdemServico::class, 'ordem_servico_id');
    }
}
