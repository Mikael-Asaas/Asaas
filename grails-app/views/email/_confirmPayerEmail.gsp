<html>
    <head>
        <%@ page import="com.desafio.utils.DateUtils" %> 
        <%@ page import="com.desafio.enums.PaymentMethod" %>
        <title>E-mail de Cobrança</title>
    </head>
<body>
    <h1><b>Comprovante de Pagamento</b></h1>   
    <h2>Grado em <g:formatDate format="dd/MM/yyyy" type="dateTime" style="SHORT" date="${payment.paymentDate}</h2>  
    <hr>
    <div>
        <div>
            <label>Forma de pagamento:</label>
            <g:message code="PaymentMethod.${}
        </div>
    </div>
</body>
</html>