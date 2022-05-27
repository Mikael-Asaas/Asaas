<html>
<head>
    <%@ page import="com.desafio.utils.DateUtils" %> 
    <title>E-mail de Cobrança</title>
</head>
    <body> 
        <p>Olá ${payment.payer.name}.</p> 
        <p>${payment.payer.name} uma cobrança no valor de R$ ${payment.value} com data de vencimento em <g:formatDate format="dd/MM/yyyy" date="${payment.dueDate}"/> foi gerada para vocÊ.</p>
    </body>
</html>