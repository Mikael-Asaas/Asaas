
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
            <input type="text" name="name" id ="name" placeholder="Nome">
            <input type="text" name="cpfCnpj" id="cpfCnpj" placeholder="CPF/CNPJ">
            <input type="text" name="email" id="email" placeholder="Email">
            <input type="text" name="phone" id="phone" placeholder="Telefone">
            <input type="text" name="postalCode" id="postalCode" placeholder="CEP">
            <input type="text" name="address" id="address" placeholder="Endereço">
            <input type="text" name="addressNumber" id="addressNumber" placeholder="Nº">
            <input type="text" name="province" id="province" placeholder="Bairro">
            <input type="text" name="city" id="city" placeholder="Localidade">
            <input type="text" name="state" id="state" placeholder="UF">
            <button type="submit">Criar</button>
            <button type="reset" onclick="history.go(-1)">Cancelar</button>
          </form>   
      </main>
        <asset:javascript src="customer.js" />
    </body>
</html> 