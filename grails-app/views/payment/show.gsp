<html>
    <head>
        <meta name="layout" content="main"/>
        <%@ page import="com.desafio.enums.PaymentMethod" %>
        <%@ page import="com.desafio.enums.PaymentStatus" %>
        <%@ page import="com.desafio.utils.DateUtils" %>
        <g:set var="entityName" value="${message(code: 'payment.label', default: 'Payment')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <asset:javascript src="application.js" />
        <title>Cobrança</title>
    </head>
    <body>
        <form data-redirect="${ g.createLink(controller: 'payment', action: 'index') }" 
            data-url="${ g.createLink(controller: 'payment', action: 'update') }" >
            <input type="hidden" class="js-payment-id" name="id" value="${payment.id}">
            <h4>Cobrança para: ${payment.payer.name}</h4>
            <h4>Data de vencimento: <g:formatDate format="dd/MM/yyyy" date="${payment.dueDate}" /></h4>
            <h4>Método do pagamento: <g:message code="PaymentMethod.${payment.method}" /></h4>
            <h4>Status do pagamento: <g:message code="PaymentStatus.${payment.status}" /></h4>
            <h4>Valor: ${payment.value}</h4>
        </form> 
        <button><a href="${ g.createLink(controller: "payment", action: "index", id: payment.id)}">Voltar</a></button>
    </body>
</html> 