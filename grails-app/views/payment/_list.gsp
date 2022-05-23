<html>
    <head>
        <meta name="layout" content="main"/>
        <%@ page import="com.desafio.enums.PaymentMethod" %>
        <%@ page import="com.desafio.enums.PaymentStatus" %>
        <%@ page import="com.desafio.utils.DateUtils" %>
        <g:set var="entityName" value="${message(code: 'payment.label', default: 'Payment')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <asset:javascript src="application.js" />
        <title>Cobranças</title>
    </head>
      <body>
        <g:if test="${paymentList?.size() > 0}">
            <table>
                <tr>
                <th>Valor</th>
                <th>Tipo de Pagamento</th>
                <th>Status</th>
                <th>Data de Vencimento</th>
                <th>Pagador</th>
                </tr>
                <g:each var="payment" in="${paymentList}">
                <tr>
                    <td>${payment.value}</td>
                    <td><g:message code="PaymentMethod.${payment.method}"/></td>
                    <td><g:message code="PaymentStatus.${payment.status}"/></td>
                    <td><g:formatDate format="dd/MM/yyyy" date="${payment.dueDate}"/></td>
                    <td>${payment.payer.name}</td>
                    <td>
                        <g:link controller="payment" action="show" update="divForm" id='${payment.id}'>Ver cobrança</g:link>
                    </td>
                    </td>
                </tr>
                </g:each>
            </table>
        </g:if>
  </body>
</html>