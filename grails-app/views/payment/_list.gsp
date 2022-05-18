<html>
    <head>
        <meta name="layout" content="main"/>
        <g:set var="entityName" value="${message(code: 'payment.label', default: 'Payment')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <asset:javascript src="application.js" />
        <title>Cobranças</title>
    </head>
      <body>
        <g:if test="${paymentList.size() > 0}">
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
                    <td>${payment.billingType}</td>
                    <td>${payment.status}</td>
                    <td>${payment.dueDate}</td>
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