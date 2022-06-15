<%@ page import="com.desafio.enums.PaymentMethod" %>
<%@ page import="com.desafio.enums.PaymentStatus" %>
<%@ page import="com.desafio.utils.DateUtils" %>
<html>
    <head>
        <meta name="layout" content="main"/>
        <g:set var="entityName" value="${message(code: 'payment.label', default: 'Payment')}"/>
        <title><g:message code="default.create.label" args="[entityName]"/></title>
        <asset:javascript src="application.js"/>
        <title>Cobrança</title>
    </head>
    <body>
        <main class="container">
        <h2 class="h2">Sua cobrança</h2>
            <form data-redirect="${ g.createLink(controller: 'payment', action: 'index') }" 
                data-url="${ g.createLink(controller: 'payment', action: 'update') }" >
                <input type="hidden" name="id" value="${payment.payerId}">
                <div class="form-controller">
                    <h4 class="h3">Cobrança para: ${payment.payer.name}</h4>
                </div>
                <div class="form-controller">
                    <h4 class="h3">Data de vencimento: <g:formatDate format="dd/MM/yyyy" date="${payment.dueDate}" /></h4>
                </div>
                <div class="form-controller">
                    <h4 class="h3">Método do pagamento: <g:message code="PaymentMethod.${payment.billingType}" /></h4>
                </div>
                <div class="form-controller">
                    <h4 class="h3">Status do pagamento: <g:message code="PaymentStatus.${payment.status}" /></h4>
                </div>
                <div class="form-controller">
                    <h4 class="h3">Valor: ${payment.value}</h4>
                </div>
            </form> 
            <button><a href="${g.createLink(controller: "payment", action: "index", params: [customerId: payment.customerId])}">Voltar</a></button>
        </main>
    </body>
</html> 
