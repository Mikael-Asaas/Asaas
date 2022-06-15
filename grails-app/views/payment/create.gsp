<%@ page import="com.desafio.enums.PaymentMethod" %>
<html>
    <head>
        <meta name="layout" content="main"/>
        <g:set var="entityName" value="${message(code: 'payment.label', default: 'Payment')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <asset:stylesheet src="utility/form.css" />
        <asset:javascript src="applicationPayment.js" />
        <title>Nova cobrança</title>
    </head>
    <body>
        <main class="container">
        <h2 class="h2">Nova cobrança</h2>
            <form class="form" data-redirect="${ g.createLink([controller: "payment", action: "index", params: [customerId: customerId]])}"
                data-url="${ g.createLink(controller: "payment", action: "save") }">
                <div class="form-controller">
                    <label class="h3" for="value">Valor:</label>
                    <input type="text" name="value" id="value" placeholder="Valor min R$ 5,00">
                    <i class="fas fa-exclamation-circle"></i>
                    <i class="fas fa-check-circle"></i>
                    <small class="js-msg"></small>
                </div>
                <div class="form-controller">
                    <label class="h3" for="dueDate">Data de vencimento:</label>
                    <input type="date" name="dueDate" id="dueDate" placeholder="Data de vencimento">
                    <i class="fas fa-exclamation-circle"></i>
                    <i class="fas fa-check-circle"></i>
                    <small class="js-msg"></small>
                </div>
                <div class="form-controller">
                    <label class="h3" for="method">Formato de pagamento:</label>
                    <g:select id="method"
                        name="billingType"
                        from="${PaymentMethod?.values()}" 
                        value="${method}"
                        noSelection="['':'Tipo de pagamento']"
                        valueMessagePrefix="PaymentMethod"/>
                    <i class="fas fa-exclamation-circle"></i>
                    <i class="fas fa-check-circle"></i>
                    <small class="js-msg"></small>
                </div>
                <div class="form-controller">
                    <label class="h3" for="payerId">Selecione o cliente:</label>
                    <select id="payerId" name="payerId" required>
                        <option>Selecione um pagador</option>
                            <g:each var="payer" in="${payerList}">
                                <option value="${payer.id}">${payer.name}</option>
                            </g:each>
                    </select>
                    <i class="fas fa-exclamation-circle"></i>
                    <i class="fas fa-check-circle"></i>
                    <small class="js-msg"></small>
                </div>
                <input hidden value="${customerId}" name="customerId" id="customerId"> 
                <button class="btn" type="submit">Salvar</button>
            </form>
        </main>
        <asset:javascript src="applicationMoney.js" />
    </body>
</html>
