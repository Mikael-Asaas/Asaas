<%@ page import="com.desafio.enums.PaymentMethod" %>
<html>
    <head>
        <meta name="layout" content="main"/>
        <g:set var="entityName" value="${message(code: 'payment.label', default: 'Payment')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <asset:stylesheet src="utility/form.css" />
        <asset:javascript src="application.js" />
        <asset:javascript src="payment.js" />
        <title>Nova cobrança</title>
    </head>
    <body>
        <main class="container">
            <h2 class="h2">Nova cobrança</h2>
            <form data-redirect="${g.createLink([controller: 'payment', action: 'index', params: [customerId: customerId]])}"
                data-url="${g.createLink(controller: 'payment', action: 'save')}">
                <input type="text" name="value" placeholder="Valor">
                <input type="date" name="dueDate" placeholder="Data de vencimento">
                <g:select id="method"
                    name="method"
                    from="${PaymentMethod?.values()}" 
                    value="${method}"
                    noSelection="['':'Tipo de pagamento']"
                    valueMessagePrefix="PaymentMethod"/>
                <select id="payerId" name="payerId" required>
                    <option>Selecione um pagador</option>
                        <g:each var="payer" in="${payerList}">
                            <option value="${payer.id}">${payer.name}</option>
                        </g:each>
                </select>
                <input hidden value="${customerId}" name="customerId" id="customerId"> 
                <button class="btn" type="submit">Salvar</button>
            </form>
        </main>
    </body>
</html>
