<html>
 <head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
     <asset:javascript src="application.js"/>
    <title>Clientes</title>
</head>
    <body>
      <main class="container">
        <h2 class="h2">Editar Cliente</h2>
          <form data-redirect="${g.createLink([controller: 'customer', action: 'index'])}" 
                data-url="${g.createLink([controller: 'customer', action: 'update'])}" readonly>        
            <input type="hidden" class="js-customer-id" name="id" value="${customer.id}">
            <input type="text" name="name" id="name" placeholder="Nome" value="${customer.name}" readonly>
            <input type="text" name="cpfCnpj" id="cpfCnpj" placeholder="CPF/CNPJ" value="${customer.cpfCnpj}" readonly>
            <input type="text" name="email" id="email" placeholder="Email" value="${customer.email}" readonly>
            <input type="text" name="phone" id="phone" placeholder="Telefone" value="${customer.phone}" readonly> 
            <input type="text" name="postalCode" id="postalCode" placeholder="CEP" value="${customer.postalCode}" readonly>
            <input type="text" name="address" id="address" placeholder="Endereço" value="${customer.address}" readonly>
            <input type="text" name="addressNumber" id="addressNumber" placeholder="Nº" value="${customer.addressNumber}" readonly>
            <input type="text" name="province" id="province" placeholder="Bairro" value="${customer.province}" readonly >
            <input type="text" name="city" id="city" placeholder="Localidade" value="${customer.city}" readonly>
            <input type="text" name="state" id="state" placeholder="UF" value="${customer.state}" readonly>
            <button class="js-edit">Editar</button>
            <button type="submit" class="js-send-button hide">Salvar</button>
            <button type="reset"> Cancelar </button>
          </form>
        <div>
            <g:link controller="payer" action="create" id="${customer.id}"><button>Criar pagador</button></g:link>
            <g:link controller="payment" action="create" id="${customer.id}"><button>Criar cobrança</button></g:link>
        </div>
      </main>
      <asset:javascript src="utility.applications.js" /> 
    </body>
</html>