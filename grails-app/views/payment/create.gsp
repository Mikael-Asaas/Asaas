<html>
    <head>
        <meta name="layout" content="main"/>
        <g:set var="entityName" value="${message(code: 'payment.label', default: 'Payment')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <asset:javascript src="application.js" />
        <title>Nova cobrança</title>
    </head>
    <body>
        <form data-redirect="${ g.createLink(controller: 'payment', action: 'index', params: [id: customerId]) }"
              data-url="${ g.createLink(controller: 'payment', action: 'save') }">
            <input type="text" name="value" placeholder="valor do pagamento">
            <input type="text" name="billingType" placeholder="Método de pagamento">
            <input type="text" name="status" placeholder="Status">
            <input type="text" name="dueDate" placeholder="Data de vencimento">
            <select id="payerId" name="payerId" required>
                <option>Selecione um pagador</option>
                    <g:each var="payer" in="${payerList}">
                        <option value="${payer.id}">${payer.name}</option>
                    </g:each>
            </select>
            <input hidden value="${customerId}" name="customerId" id="customerId">    
            <div><button type="submit">Salvar</button></div>       
        </form>
    </body>
</html>
