<g:if test="${paymentList?.size() > 0}">
    <table>
        <tr>
            <th>ID</th>
            <th>Valor</th>
            <th>Tipo de Pagamento</th>
            <th>Status</th>
            <th>Data de Vencimento</th>
            <th>Pagador</th>
        </tr>
        <g:each var="payment" in="${paymentList}">
            <tr>
                <td>${payment.id}</td>
                <td>${payment.value}</td>
                <td><g:message code="PaymentMethod.${payment.method}"/></td>
                <td><g:message code="PaymentStatus.${payment.status}"/></td>
                <td><g:formatDate format="dd/MM/yyyy" date="${payment.dueDate}"/></td>
                <td>${payment.payer.name}</td>
                <td>
                    <g:link controller="payment" action="show" update="divForm" id="${payment.id}">Ver cobrança</g:link>
                    <g:link controller="payment" action="confirm" update="divForm" id="${payment.id}">Confirmar pagamento</g:link>
                </td>
                </td>
            </tr>
        </g:each>
    </table>
</g:if>
<g:else>
    <div>Nenhuma cobrança gerada.</div>
</g:else>
