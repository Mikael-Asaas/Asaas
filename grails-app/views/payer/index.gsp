<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta name="layout" content="main" />
    <title>Gerenciamento da conta</title>
</head>
<body>
    <div>
        <g:link controller="payer" action="create" update="divForm">Criando conta</g:link>
    </div>
    
    <a href="/payer">Meus Clientes</a>

    <div id="divLista">
        <g:render template="list" model="[payerList: payerList]"></g:render>
    </div>
    <div id="divForm"></div>
</body>
</html>