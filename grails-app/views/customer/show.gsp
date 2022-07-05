<html>
 <head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
    <asset:javascript src="application.js"/>
    <title>Clientes</title>
</head>
    <body>
      <form data-redirect="${g.createLink([controller: 'customer', action: 'index'])}" 
            data-url="${g.createLink([controller: 'customer', action: 'update'])}" readonly>        
        <input type="hidden" class="js-customer-id" name="id" value="${this.id}">
        <input type="text" name="name" id="name" placeholder="Nome" value="${this.name}">
        <input type="text" name="cpfCnpj" id="cpfCnpj" placeholder="CPF/CNPJ" value="${this.cpfCnpj}">
        <input type="text" name="email" id="email" placeholder="Email" value="${this.email}" readonly>
        <input type="text" name="phone" id="phone" placeholder="Telefone" value="${this.phone}"> 
        <input type="text" name="postalCode" id="postalCode" placeholder="CEP" value="${this.postalCode}">
        <input type="text" name="address" id="address" placeholder="Endereço" value="${this.address}" >
        <input type="text" name="addressNumber" id="addressNumber" placeholder="Nº" value="${this.addressNumber}" >
        <input type="text" name="province" id="province" placeholder="Bairro" value="${this.province}" >
        <input type="text" name="city" id="city" placeholder="Localidade" value="${this.city}" >
        <input type="text" name="state" id="state" placeholder="UF" value="${this.state}" >
        
        <button type="submit" >Salvar</button>
        <button type="reset"> Cancelar </button>
      </form>
      <div>
          <g:link controller="payer" action="create" ><button>Criar pagador</button></g:link>
      </div>
        <asset:javascript src="payer.js" /> 
      </body>
</html>
