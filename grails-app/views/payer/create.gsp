<html>
  <head>
    <script
      src="https://kit.fontawesome.com/c8d140aaae.js" crossorigin="anonymous">
    </script>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'payer.label', default: 'Payer')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
    <asset:stylesheet src="utility/form.css" />
    <asset:javascript src="application.js" />
    <title>Novo Pagador</title>
  </head>
  <body>
    <main class="container">
      <h2 class="h2">Novo Pagador</h2>
      <form data-redirect="${g.createLink([controller: 'payer', action: 'index', params: [id: customerId]])}"
            data-url="${g.createLink([controller: 'payer', action: 'save'])}">
          <div class="form-controller">
            <label for="name">Nome:</label>
            <input type="text" name="name" id ="name" placeholder="Nome">
            <i class="fas fa-exclamation-circle"></i>
            <i class="fas fa-check-circle"></i>
            <small class="js-msg"></small>
          </div>
          <div class="form-controller">
            <label for="email">E-mail:</label>
            <input type="text" name="email" id="email" placeholder="Email">
            <i class="fas fa-exclamation-circle"></i>
            <i class="fas fa-check-circle"></i>
            <small class="js-msg"></small>
          </div>            
          <div class="form-controller two">
            <label for="cpfCnpj">CPF/CNPJ:</label>
            <input type="text" name="cpfCnpj" id="cpfCnpj" placeholder="CPF/CNPJ">
            <i class="fas fa-exclamation-circle"></i>
            <i class="fas fa-check-circle"></i>
            <small class="js-msg"></small>
          </div>
          <div class="form-controller two left">
            <label for="phone">Telefone:</label>
            <input type="text" name="phone" id="phone" placeholder="Telefone">
            <i class="fas fa-exclamation-circle"></i>
            <i class="fas fa-check-circle"></i>
            <small class="js-msg"></small>
          </div>     
          <div class="form-controller two">
            <label for="postalCode">CEP:</label>
            <input type="text" name="postalCode" id="postalCode" placeholder="CEP">
            <i class="fas fa-exclamation-circle"></i>
            <i class="fas fa-check-circle"></i>
            <small class="js-msg"></small>
          </div>
          <div class="form-controller two left">
            <label for="address">Endereço:</label>
            <input type="text" name="address" id="address" placeholder="Endereço">
            <i class="fas fa-exclamation-circle"></i>
            <i class="fas fa-check-circle"></i>
            <small class="js-msg"></small>     
          </div>
          <div class="form-controller two">
            <label for="addressNumber">Nº:</label>
            <input type="text" name="addressNumber" id="addressNumber" placeholder="Nº">
            <i class="fas fa-exclamation-circle"></i>
            <i class="fas fa-check-circle"></i>
            <small class="js-msg"></small>
          </div>
          <div class="form-controller two left">
            <label for="province">Bairro:</label>
            <input type="text" name="province" id="province" placeholder="Bairro">
            <i class="fas fa-exclamation-circle"></i>
            <i class="fas fa-check-circle"></i>
            <small class="js-msg"></small>
          </div>
          <div class="form-controller two">
            <label for="City">Localidade:</label>
            <input type="text" name="city" id="city" placeholder="Localidade">
            <i class="fas fa-exclamation-circle"></i>
            <i class="fas fa-check-circle"></i>
            <small class="js-msg"></small>
          </div>
          <div class="form-controller two left">
            <label for="state">Estado:</label>
            <input type="text" name="state" id="state" placeholder="UF">
            <i class="fas fa-exclamation-circle"></i>
            <i class="fas fa-check-circle"></i>
            <small class="js-msg"></small>
          </div>
        <input hidden value="${ customerId }" name="customerId" id="customer">
        <button class="btn" type="submit">Criar</button>
        <button class="btn" type="reset" onclick="history.go(-1)">Voltar</button>
      </form>   
    </main>
    <asset:javascript src="utility.applications.js" />
  </body>
</html> 
