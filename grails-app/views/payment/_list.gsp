<%@ page import="com.desafio.enums.PaymentMethod" %>
<%@ page import="com.desafio.enums.PaymentStatus" %>
<%@ page import="com.desafio.utils.DateUtils" %>
<html>
    <head>
        <meta name="layout" content="main"/>
        <g:set var="entityName" value="${message(code: 'payment.label', default: 'Payment')}"/>
        <title><g:message code="default.create.label" args="[entityName]"/></title>
        <asset:javascript src="application.js"/>
        <title>Cobranças</title>
    </head>
    <body>
        <g:if test="${paymentList}">
            <table>
                <tr>
                    <th>ID</th>
                    <th>Valor</th>
                    <th>Forma de pagamento</th>
                    <th>Status</th>
                    <th>Data de Vencimento</th>
                    <th>Pagador</th>
                </tr>
                <g:each var="payment" in="${paymentList}">
                    <tr>
                        <td>${payment.id}</td>
                        <td>${payment.value}</td>
                        <td><g:message code="PaymentMethod.${payment.billingType}"/></td>
                        <td><g:message code="PaymentStatus.${payment.status}"/></td>
                        <td><g:formatDate format="dd/MM/yyyy" date="${payment.dueDate}"/></td>
                        <td>${payment.payer.name}</td>
                        <td>
                            <g:link controller="payment" action="show" update="form" params="${[paymentId: payment.id]}">Ver cobrança</g:link>
                            <g:link controller="payment" action="confirm" update="form" params="${[paymentId: payment.id]}">Confirmar pagamento</g:link>
                        </td>
                        </td>
                    </tr>
                </g:each>
            </table>
        </g:if>
        <g:else>
            <div>Nenhuma cobrança gerada.</div>
        </g:else>
    </body>
</html>