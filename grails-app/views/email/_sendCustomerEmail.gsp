<html>
<head>
    <%@ page import="com.desafio.utils.DateUtils" %> 
    <title>E-mail de Cobrança</title>
</head>
    <body> 
        <p>Olá ${payment.customer.name}.</p> 
        <p>${payment.customer.name} uma cobrança no valor de R$ ${payment.value} com data de vencimento em <g:formatDate format="dd/MM/yyyy" date="${payment.dueDate}"/> foi gerada.</p>
    </body>
</html>