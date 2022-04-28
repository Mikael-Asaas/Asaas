
<html>
    <head>
        <meta name="layout" content="main"/>
        <g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <asset:javascript src="application.js" />
    </head>
    <body>
      <main class="container">
        <h2 class="h2">Novo Cliente</h2>
          <form data-url-redirect="${g.createLink(controller: 'customer', action: 'index')}"
                action="${g.createLink(controller: 'customer', action: 'save')}">
            <input type="text" name="name" placeholder="Nome">
            <input type="text" name="cpf" placeholder="CPF/CNPJ">
            <input type="text" name="email" placeholder="Email">
            <input type="text" name="telephone" placeholder="Telefone">
            <input type="text" name="cep" placeholder="CEP">
            <input type="text" name="address" placeholder="Endereço">
            <input type="text" name="number" placeholder="Nº">
            <input type="text" name="district" placeholder="Bairro">
            <input type="text" name="city" placeholder="Localidade">
            <input type="text" name="state" placeholder="UF">
            <button type="submit">Criar</button>
          </form>   
      </main>
        <asset:javascript src="customer/customerSave.js" />
    </body>
</html> 