<html>
    <head>
        <meta name="layout" content="main"/>
        <g:set var="entityName" value="${message(code: 'payment.label', default: 'Payment')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <asset:javascript src="application.js" />
        <title>Cobrança</title>
    </head>
    <body>
        <form data-redirect="${ g.createLink(controller: 'payment', action: 'index') }" 
            data-url="${ g.createLink(controller: 'payment', action: 'update') }" >
            <input type="hidden" class="js-payment-id" name="id" value="${payment.id}">
            <input type="text" name="value" placeholder="valor do pagamento" value="${payment.value}" readonly>
            <input type="text" name="method" placeholder="Método de pagamento" value="${payment.method}" readonly>
            <input type="text" name="status" placeholder="Status" value="${payment.status}" readonly>
            <input type="text" name="dueDate" placeholder="Data de vencimento" value="${payment.dueDate}" readonly>
            <input type="text" name="payer" placeholder="Pagador" value="${payment.payer.name}" readonly>
        </form> 
    </body>
</html> 