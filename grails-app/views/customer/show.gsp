<html>
  <head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
    <asset:stylesheet src="utility/form.css" />
    <asset:javascript src="application.js" />
    <title>Clientes</title>
  </head>
  <body>
    <main class="container">
      <h2 class="h2">Dados de ${customer.name}</h2>
        <form data-redirect="${g.createLink([controller: 'customer', action: 'index'])}" 
              data-url="${g.createLink([controller: 'customer', action: 'update'])}"
              action="${g.createLink([controller: "customer", action: "update"])}">
          <input type="hidden" class="js-customer-id" name="id" value="${customer.id}">
          <div class="form-controller">
            <label class="h3" for="name">Nome:</label>
            <input type="text" name="name" id="name" placeholder="Nome" value="${customer.name}">
            <i class="fas fa-exclamation-circle"></i>
            <i class="fas fa-check-circle"></i>
            <small class="js-msg"></small>
          </div>
          <div class="form-controller">
            <label class="h3" for="email">E-mail:</label>
            <input type="text" name="email" id="email" placeholder="Email" value="${customer.email}">
            <i class="fas fa-exclamation-circle"></i>
            <i class="fas fa-check-circle"></i>
            <small class="js-msg"></small>
          </div>
          <div class="form-controller two-columns">
            <label class="h3" for="cpfCnpj">CPF/CNPJ:</label>
            <input type="text" name="cpfCnpj" id="cpfCnpj" placeholder="CPF/CNPJ" value="${customer.cpfCnpj}">
            <i class="fas fa-exclamation-circle"></i>
            <i class="fas fa-check-circle"></i>
            <small class="js-msg"></small>
          </div>
          <div class="form-controller two-columns left">
            <label class="h3" for="phone">Telefone:</label>
            <input type="text" name="phone" id="phone" placeholder="Telefone" value="${customer.phone}">
            <i class="fas fa-exclamation-circle"></i>
            <i class="fas fa-check-circle"></i>
            <small class="js-msg"></small>
          </div>
          <div class="form-controller two-columns">
            <label class="h3" for="postalCode">CEP:</label>
            <input type="text" name="postalCode" id="postalCode" placeholder="CEP" value="${customer.postalCode}" >
            <i class="fas fa-exclamation-circle"></i>
            <i class="fas fa-check-circle"></i>
            <small class="js-msg"></small>
          </div>
          <div class="form-controller two-columns left">
            <label class="h3" for="address">Endereço:</label>
            <input type="text" name="address" id="address" placeholder="Endereço" value="${customer.address}">
            <i class="fas fa-exclamation-circle"></i>
            <i class="fas fa-check-circle"></i>
            <small class="js-msg"></small>
          </div>
          <div class="form-controller two-columns">
            <label class="h3" for="addressNumber">Nº:</label>
            <input type="text" name="addressNumber" id="addressNumber" placeholder="Nº" value="${customer.addressNumber}">
            <i class="fas fa-exclamation-circle"></i>
            <i class="fas fa-check-circle"></i>
            <small class="js-msg"></small>
          </div>
          <div class="form-controller two-columns left">
            <label class="h3" for="province">Bairro:</label>
            <input type="text" name="province" id="province" placeholder="Bairro" value="${customer.province}">
            <i class="fas fa-exclamation-circle"></i>
            <i class="fas fa-check-circle"></i>
            <small class="js-msg"></small>
          </div>
          <div class="form-controller two-columns">
            <label class="h3" for="city">Localidade:</label>
            <input type="text" name="city" id="city" placeholder="Localidade" value="${customer.city}">
            <i class="fas fa-exclamation-circle"></i>
            <i class="fas fa-check-circle"></i>
            <small class="js-msg"></small>
          </div>
          <div class="form-controller two-columns left">
            <label class="h3" for="state">Estado:</label>
            <input type="text" name="state" id="state" placeholder="UF" value="${customer.state}">
            <i class="fas fa-exclamation-circle"></i>
            <i class="fas fa-check-circle"></i>
            <small class="js-msg"></small>
          </div>
          <button type="submit" class="btn">Salvar</button>
          <button class="btn" type="reset"> Cancelar </button> 
        </form>
    </main>
    <asset:javascript src="utility.applications.js" /> 
  </body>
</html>
