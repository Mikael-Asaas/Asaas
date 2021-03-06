<html>
    <head>
        <meta name="layout" content="main"/>
        <g:set var="entityName" value="${message(code: 'payer.label', default: 'Payer')}"/>
        <title><g:message code="default.create.label" args="[entityName]"/></title>
        <asset:javascript src="application.js"/>
        <title>Pagadores</title>
    </head>
    <body>
        <div>
            <g:link controller="customer" action="index" update="form">Asaas - Cliente</g:link>
        </div>

        <div id="lista">
            <g:render template="list" model="[payerList: payerList]"></g:render>
        </div>
        <div id="form"></div>

        <g:paginate total="${totalCount}" controller="payer" action="index" params="${params}" next="Próximo" prev="Anterior" max="10" />
    </body>
</html>
