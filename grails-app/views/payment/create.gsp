<html>
    <head>
        <%@ page import="com.desafio.enums.PaymentMethod" %>
        <meta name="layout" content="main"/>
        <g:set var="entityName" value="${message(code: 'payment.label', default: 'Payment')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <asset:javascript src="application.js" />
        <title>Nova cobrança</title>
    </head>
    <body>
        <main class="container">
        <h2 class="h2">Nova cobrança</h2>
            <form data-redirect="${ g.createLink(controller: 'payment', action: 'index', params: [id: customerId]) }"
                data-url="${ g.createLink(controller: 'payment', action: 'save') }">
                <input type="text" name="value" placeholder="valor">
                <input type="text" name="status" placeholder="Status">
                <input type="date" name="dueDate" placeholder="Data de vencimento">
                <g:select id="method"
                    name="method"
                    from="${PaymentMethod?.values()}" 
                    value="${method}"
                    noSelection="['':'Tipo de pagamento']"/>
                <select id="payerId" name="payer Id" required>
                    <option>Selecione um pagador</option>
                        <g:each var="payer" in="${payerList}">
                            <option value="${payer.id}">${payer.name}</option>
                        </g:each>
                </select>
                <input hidden value="${customerId}" name="customerId" id="customerId">    
                <div><button type="submit">Salvar</button></div>       
            </form>
        </main>
    </body>
</html>
