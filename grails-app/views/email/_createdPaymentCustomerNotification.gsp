<%@ page import="com.desafio.utils.DateUtils" %> 
<%@ page import="com.desafio.enums.PaymentMethod" %>
<html>
    <head>
        <title>E-mail de Cobrança</title>
    </head>
<body>
    <div>
        <div>
            <h1><b>Olá ${payment.customer.name}, você emitiu uma nova cobrança</b></h1>
            <a href="payment/show/${payment.customerId}">Acesse sua cobrança</a>
        </div>
        <hr>
        <div>
            <p><h2>Dados da cobrança.</h2></p>
        </div>
        <div>
            <label><b>Cobrança gerada para:</b></label>
            ${payment.payer.name}
        <div>
            <label><b>Portador do CPF/CNPJ:</b></label>
            ${payment.payer.cpfCnpj}
        </div>
        <div>
            <label><b>Valor de:</b></label>
            R$${payment.value}
        </div>
        <div>
            <label><b>Data do vencimento:</b></label>
            <g:formatDate format="dd/MM/yyyy" date="${payment.dueDate}"/>
        </div>    
    </div>    
</body>
</html>
