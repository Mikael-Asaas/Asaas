<html>
    <head>
        <%@ page import="com.desafio.utils.DateUtils" %> 
        <%@ page import="com.desafio.enums.PaymentMethod" %>
        <title>E-mail de Cobrança</title>
    </head>
<body>
    <h1><b>Comprovante de Pagamento</b></h1>   
    <h2>Grado em <g:formatDate format="dd/MM/yyyy" type="dateTime" style="SHORT" date="${payment.paymentDate}"/></h2>  
    <hr>
    <div>
        <div>
            <label>Forma de pagamento:</label>
            <g:message code="PaymentMethod.${payment.method}"/>
        </div>
        <div>
            <label>Valor pago:</label>
            R$${payment.value}
        </div>
        <div>
            <label>Data do vencimento:</label>
            <g:formatDate format="dd/MM/yyyy" date="${payment.dueDate}"/>
        </div>
        <div>
            <lavel>Data do pagamento:</lavel>
            <g:formatDate format="dd/MM/yyyy" type="dateTime" style="SHORT" date="${payment.paymentDate}"/>
        </div>
        <hr>
        <div>
            <label>Dados do pagador</label>
        </div>
        <div>
            <label>Nome></label>
            ${payment.payer.name}
        </div>
        <div>
            <label>CPF/CNPJ</label>
            ${payment.payer.cpfCnpj}
        </div>
        <hr>
        <div>
            <label>Dados do destinatário</label>
        </div>
        <div>
            <label>Nome:</label>
        ${payment.customer.name}
        </div>
        <div>
            <label>CPF/CNPJ</label>
            ${payment.customer.cpfCnpj}
        </div>
    </div>
    <hr>
    <div>
        <p>Asaas - O jeito mais rápido e barato de gerenciar toda a parte financeira do seu negócio</p>
    </div>
</body>
</html>