<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
    <asset:javascript src="application.js"/>
    <title>Clientes</title>
</head>
    <body>
        <div>
            <g:link controller="customer" action="create" update="divForm">Criando conta</g:link>
        </div>
            <a href="/customer">Meus Clientes</a>
        <div id="divLista">
            <g:render template="list" model="[customerList: customerList]"> </g:render>
        </div>
            <g:paginate total="${totalCount}" controller="customer" action="index" params="${params}" next="Próximo" prev="Anterior" max="10" /><div id="divForm"></div>      
    </body>
</html>
