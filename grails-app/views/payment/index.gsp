<html>
    <head>
        <meta name="layout" content="main"/>
        <g:set var="entityName" value="${message(code: 'payment.label', default: 'Payment')}"/>
        <title><g:message code="default.create.label" args="[entityName]"/></title>
        <asset:javascript src="application.js"/>
        <title>Cobrança</title>
    </head>
    <body>
        <div>
            <g:link controller="payment" action="create" update="form">Novo cobrança</g:link>
        </div>

        <div id="lista">
            <g:render template="list" model="[paymentList: paymentList]"></g:render>
        </div>
        <div id="form"></div>

        <g:paginate total="${totalCount}" controller="payment" action="index" params="${params}" next="Próximo" prev="Anterior" max="10" />
    </body>
</html>