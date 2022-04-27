<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta name="layout" content="main" />
    <title>Gerenciamento da conta</title>
</head>
<body>
    <div>
        <g:link controller="payer" action="create" update="divForm">Criar conta</g:link>
    </div>
    
    <a href="/payer">Meus Clientes</a>

    <div id="divLista">
        <g:render template="list" model="[payerList: payerList]"></g:render>
    </div>
    <div id="divForm"></div>

    <g:paginate total="${totalCount}" controller="payer" action="index" params="${params}" next="Próximo" prev="Anterior" max="3" />

</body>
</html>