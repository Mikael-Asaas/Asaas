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
            <g:link controller="customer" action="index" params="${customerId}" update="divForm">Asaas - Cliente</g:link>
        </div>

        <div id="divLista">
            <g:render template="list" model="[paymentList: paymentList]"></g:render>
        </div>
        <div id="divForm"></div>

        <g:paginate total="${totalCount}" controller="payment" action="index" params="${params}" next="Próximo" prev="Anterior" max="10" />
    </body>
</html>
