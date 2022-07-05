<%@ page import="com.desafio.utils.DateUtils" %> 
<%@ page import="com.desafio.enums.PaymentMethod" %>
<html>
    <head>
        <title>E-mail de Cobrança</title>
    </head>
<body>
    <div>
        <div>
            <h1><b>Olá ${payment.customer.name}.<br> O pagamento referente a cobrança emitida para ${payment.payer.name} foi debitada com sucesso.</br></b></h1>
            <a href="payment/show/${payment.customerId}">Acesse sua cobrança</a>
        </div>
        <hr>
        <div>
            <h2><b>Resumo da cobrança</b></h2>
        </div>
        <div>
            <label><b>Forma de pagamento:</b></label>
            <g:message code="PaymentMethod.${payment.method}"/>
        </div>
        <div>
            <label><b>Valor pago:</b></label>
            R$ ${payment.value}
        </div>
        <div>
            <label><b>Data do vencimento:</b></label>
            <g:formatDate format="dd/MM/yyyy" date="${payment.dueDate}"/>
        </div>
        <div>
            <lavel><b>Data do pagamento:</b></lavel>
            <g:formatDate format="dd/MM/yyyy" type="dateTime" style="SHORT" date="${payment.paymentDate}"/>
        </div>
    </div>
</body>
</html>