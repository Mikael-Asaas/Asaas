<!DOCTYPE html>
<html lang="pt-br">
  <head>

    <title>Asaas - Cliente</title>
  </head>
  <body>
<g:if test="${ dashboard }">
    <div class="container row dashboard">
        <h5 class="text-center">Resumo de cobranças</h5>
        <div class="col text-center">
            <h6>Valores</h6>
            <div class="card text-center green-text">
                <div class="card-header">
                    Recebidos
                </div>
                <div class="card-body">
                    R$ ${ dashboard.received }
                </div>
            </div>
            <div class="card text-center yellow-text">
                <div class="card-header">
                    à Receber
                </div>
                <div class="card-body">
                    R$ ${ dashboard.foreseen }
                </div>
            </div>
            <div class="card text-center red-text">
                <div class="card-header">
                    Vencidos
                </div>
                <div class="card-body">
                    R$ ${ dashboard.overdue }
                </div>
            </div>
        </div>
        <div class="col text-center">
            <h6>Clientes</h6>
            <div class="card text-center">
                <div class="card-header">
                    Total
                </div>
                <div class="card-body">
                    ${ dashboard.totalPayers }
                </div>
            </div>
            <div class="card text-center green-text">
                <div class="card-header">
                    Adimplentes
                </div>
                <div class="card-body">
                    ${ dashboard.nonDefaulters }
                </div>
            </div>
            <div class="card text-center red-text">
                <div class="card-header">
                    Inadimplentes
                </div>
                <div class="card-body">
                    ${ dashboard.defaulters }
                </div>
            </div>
        </div>
    </div>
</g:if>
  </body>
</html>  