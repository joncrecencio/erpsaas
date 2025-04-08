@extends('default.layout', ['title' => 'Gráficos'])
@section('content')

<div class="page-content">
    <div class="card card-custom gutter-b">
        <div class="card-body">
            @if(empresaComFilial() && sizeof(getLocaisUsarioLogado()) > 0)
            <div class="row">
                {!! __view_locais_select_home() !!}
                <div class="col-12 col-lg-4" style="margin-top: 38px">
                    <button id="set-location" class="btn btn-info">Definir como padrão</button>
                </div>
            </div>
            @endif

            <!-- Linha para cards de informações -->
            <div class="row mt-3">
                <div class="col-12 col-lg-3 mb-4">
                    <div class="card radius-10 overflow-hidden bg-gradient-cosmic">
                        <div class="card-body">
                            <div class="d-flex align-items-center m-1">
                                <div>
                                    <p class="mb-0 text-white">Produtos cadastrados</p>
                                    <h5 class="mb-0 text-white total_produtos">0</h5>
                                </div>
                                <div class="ms-auto text-white">
                                    <i class='bx bx-wallet font-30'></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-lg-3 mb-4">
                    <div class="card radius-10 overflow-hidden bg-gradient-Ohhappiness">
                        <div class="card-body">
                            <div class="d-flex align-items-center m-1">
                                <div>
                                    <p class="mb-0 text-white">Contas a Receber</p>
                                    <h5 class="mb-0 text-white total_receber">R$ {{ __moeda(0) }}</h5>
                                </div>
                                <div class="ms-auto text-white">
                                    <i class='bx bx-money font-30'></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-lg-3 mb-4 dash-conta">
                    <div class="card radius-10 overflow-hidden bg-gradient-moonlit">
                        <div class="card-body">
                            <div class="d-flex align-items-center m-1">
                                <div>
                                    <p class="mb-0 text-white">Contas a Pagar</p>
                                    <h5 class="mb-0 text-white total_pagar">R$ {{ __moeda(0) }}</h5>
                                </div>
                                <div class="ms-auto text-white">
                                    <i class='bx bx-money font-30'></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Gráficos -->
            <div class="row @if (env('ANIMACAO')) animate__animated @endif animate__bounce">
                <div class="col-12">
                    <div class="card radius-10">
                        <div class="card-header border-bottom-0 bg-transparent">
                            <div class="d-lg-flex align-items-center">
                                <div>
                                    <h5 class="font-weight-bold mb-2 mb-lg-0">Faturamento de Vendas Anual</h5>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div id="chart1"></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12 col-lg-6">
                    <div class="card radius-10">
                        <div class="card-header border-bottom-0 bg-transparent">
                            <div class="d-lg-flex align-items-center">
                                <div>
                                    <h6 class="font-weight-bold mb-2 mb-lg-0">Movimentação de Produtos Anual</h6>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div id="chart2"></div>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-lg-6">
                    <div class="card radius-10">
                        <div class="card-header border-bottom-0 bg-transparent">
                            <div class="d-lg-flex align-items-center">
                                <div>
                                    <h6 class="font-weight-bold mb-2 mb-lg-0">Contas a Receber</h6>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div id="chart4"></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12 col-lg-6">
                    <div class="card radius-10">
                        <div class="card-header border-bottom-0 bg-transparent">
                            <div class="d-lg-flex align-items-center">
                                <div>
                                    <h6 class="font-weight-bold mb-2 mb-lg-0">Contas a Pagar</h6>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div id="chart9"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@section('js')
<script src="/assets/js/apexcharts.min.js"></script>
<script src="/js/grafico.js"></script>
@endsection
@endsection
