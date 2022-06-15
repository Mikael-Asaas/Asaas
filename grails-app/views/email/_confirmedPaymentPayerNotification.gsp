<%@ page import="com.desafio.utils.DateUtils" %> 
<%@ page import="com.desafio.enums.PaymentMethod" %>
<html>
    <head>
        <title>E-mail de Cobrança</title>
    </head>
<body>
    <div>
        <h1><b>Comprovante de Pagamento</b></h1>
    </div>
    <hr>
    <div>
        <div>
            <h2><b>Resumo da cobrança</b></h2>
        </div>
        <div>
            <label><b>Forma de pagamento:</b></label>
            <g:message code="PaymentMethod.${payment.method}"/>
        </div>
        <div>
            <label><b>Valor pago:</b></label>
            R$${payment.value}
        </div>
        <div>
            <label><b>Data do vencimento:</b></label>
            <g:formatDate format="dd/MM/yyyy" date="${payment.dueDate}"/>
        </div>
        <div>
            <lavel><b>Data do pagamento:</b></lavel>
            <g:formatDate format="dd/MM/yyyy" type="dateTime" style="SHORT" date="${payment.paymentDate}"/>
        </div>
        <hr>
        <div>
            <h2><b>Dados do pagador</b></h2>
        </div>
        <div>
            <label><b>Nome:</b></label>
            ${payment.payer.name}
        </div>
        <div>
            <label><b>CPF/CNPJ</b></label>
            ${payment.payer.cpfCnpj}
        </div>
        <hr>
        <div>
            <h2><b>Dados do destinatário</b></h2>
        </div>
        <div>
            <label><b>Nome:</b></label>
            ${payment.customer.name}
        </div>
        <div>
            <label><b>CPF/CNPJ</b></label>
            ${payment.customer.cpfCnpj}
        </div>
    </div>
    <hr>
    <div>
        <p>Asaas - O jeito mais rápido e barato de gerenciar toda a parte financeira do seu negócio</p>
    </div>
</body>
</html>
