<html>
    <head>
        <meta name="layout" content="main"/>
        <g:set var="entityName" value="${message(code: 'payment.label', default: 'Payment')}"/>
        <title><g:message code="default.create.label" args="[entityName]"/></title>
        <asset:javascript src="application.js"/>
        <title>Cobrança</title>
    </head>
    <body>
        <g:if test='${flash.message}'>
            <div class="alert alert-danger" role="alert">${flash.message}</div>
        </g:if>
        <div>
            <g:link controller="customer" action="index" params="${[customerId: customerId]}" update="form">Asaas - Cliente</g:link>
        </div>

        <div id="lista">
            <g:render template="list" model="[paymentList: paymentList]"></g:render>
        </div>
        <div id="form"></div>

        <g:paginate total="${totalCount}" controller="payment" action="index" params="${[customerId: customerId]}"  next="Próximo" prev="Anterior" max="10" />
    </body>
</html>