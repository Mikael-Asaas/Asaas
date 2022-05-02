<html>
    <head>
        <meta name="layout" content="main"/>
        <g:set var="entityName" value="${message(code: 'payer.label', default: 'Payer')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <asset:javascript src="application.js" />
        <title>Novo Pagador</title>
    </head>
    <body>
    <main class="container">
      <h2 class="h2">Novo Pagador</h2>
      <form data-url-redirect="${g.createLink(controller: 'payer', action: 'index', params: [id: customerId])}"
            action="${g.createLink(controller: 'payer', action: 'save')}">
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
        <input hidden value="${ customerId}" name="customer" id="customer">
        <button type="submit">Criar</button>
        <button type="reset">Cancelar</button>
      </form>   
    </main>
    <asset:javascript src="payer.js" />
    </body>
</html> 

