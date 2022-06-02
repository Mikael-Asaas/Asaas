<html>
    <head>
        <%@ page import="com.desafio.utils.DateUtils" %> 
        <%@ page import="com.desafio.enums.PaymentMethod" %>
        <title>E-mail de Cobrança</title>
    </head>
<body> 
    <div>
        <div>
            <h1><b>Olá ${payment.payer.name}, você recebeu uma nova cobrança de ${payment.customer.name}.</b></h1>
        </div>
        <hr>
        <div>
            <p><h2>Dados da cobrança.</h2></p>
        </div>
        <div>
            <label><b>Cobrança gerada por:</b></label>
            ${payment.customer.name}
        <div>
            <label><b>Portador do CPF/CNPJ:</b></label>
            ${payment.customer.cpfCnpj}
        </div>
        <div>
            <label><b>Valor:</b></label>
            R$${payment.value}
        </div>
        <div>
            <label><b>Data do vencimento:</b></label>
            <g:formatDate format="dd/MM/yyyy" date="${payment.dueDate}"/>
        </div>   
    </div>
</body>
</html>
