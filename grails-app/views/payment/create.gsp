<html>
    <head>
        <%@ page import="com.desafio.enums.PaymentMethod" %>
        <meta name="layout" content="main"/>
        <g:set var="entityName" value="${message(code: 'payment.label', default: 'Payment')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <asset:stylesheet src="utility/form.css" />
        <asset:javascript src="application.js" />
        <asset:javascript src="payment.js" />
        <title>Nova cobrança</title>
    </head>
    <body>
        <main class="container">
        <h2 class="h2">Nova cobrança</h2>
            <form data-redirect="${ g.createLink([controller: "payment", action: "index", params: [id: customerId]]) }"
                data-url="${ g.createLink(controller: "payment", action: "save") }">

                <div class="form-center">
                    <label class="h3" for="value">Valor:</label>
                    <input type="text" name="value" placeholder="valor">
                </div>

                <div class="form-center">
                    <label class="h3" for="dueDate">Data de vencimento:</label>
                    <input type="date" name="dueDate" placeholder="Data de vencimento">
                </div>

                <div class="form-center">
                    <label class="h3" for="method">Formato de pagamento:</label>
                    <g:select id="method"
                        name="method"
                        from="${PaymentMethod?.values()}" 
                        value="${method}"
                        noSelection="['':'Tipo de pagamento']"
                        valueMessagePrefix="PaymentMethod"/>
                </div>

                <div class="form-center">
                    <label class="h3" for="payerId">Selecione o cliente:</label>
                    <select id="payerId" name="payerId" required>
                        <option>Selecione um pagador</option>
                            <g:each var="payer" in="${payerList}">
                                <option value="${payer.id}">${payer.name}</option>
                            </g:each>
                    </select>
                </div>

                <input hidden value="${customerId}" name="customerId" id="customerId"> 
                <button class="btn" type="submit">Salvar</button>
            </form>
        </main>
    </body>
</html>
