<html>
<head>
    <%@ page import="com.desafio.utils.DateUtils" %> 
    <title>E-mail de Cobrança</title>
</head>
    <body> 
        <p>Olá ${payment.payer.name}, uma cobraça foi gerada.</p> 
        <p>${payment.customer.name} gerou uma cobrança para você, no valor de R$ ${payment.value} com data de vencimento em <g:formatDate format="dd/MM/yyyy" date="${payment.dueDate}"/></p>
    </body>
</html>