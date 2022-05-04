<html>
    <head>
        <meta name="layout" content="main"/>
        <g:set var="entityName" value="${message(code: 'payment.label', default: 'Payment')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <asset:javascript src="application.js" />
        <title>Cobrança</title>
    </head>
    <body>
        <main class="container">
            <h2 class="h2">Nova cobrança</h2>
            <form action="${g.createLink(controller: 'payment', action: 'save')}">
                <input type="text" name="name" id="name" placeholder="Nome">
                <input type="text" name="cpf" id="cpf" placeholder="CPF/CNPJ">
                <input type="text" name="email" id="email" placeholder="Email">
                <input type="text" name="telephone" id="telephone" placeholder="Telefone">
                <input type="text" name="cep" id="cep" placeholder="CEP">
                <input type="text" name="address" id="address" placeholder="Endereço">
                <input type="text" name="number" id="number" placeholder="Nº">
                <input type="text" name="district" id="district" placeholder="Bairro">
                <input type="text" name="city" id="city" placeholder="Localidade">
                <input type="text" name="state" id="state" placeholder="UF">
                <button type="submit">Criar</button>
        </main>
    </body>
</html>