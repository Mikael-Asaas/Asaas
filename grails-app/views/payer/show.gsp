<html>
    <head>
        <meta name="layout" content="main"/>
        <g:set var="entityName" value="${message(code: 'payer.label', default: 'Payer')}"/>
        <title><g:message code="default.create.label" args="[entityName]"/></title>
        <asset:javascript src="application.js"/>
        <title>Editar Pagador</title>
    </head>
    <body>
      <main class="container">
        <h2 class="h2">Editar Pagador</h2>
        <form data-redirect="${g.createLink([controller: 'payer', action: 'index', params: [id: payer.customer.id]])}"
              data-url="${g.createLink([controller: 'payer', action: 'update'])}">
          <input type="hidden" class="js-payer-id" name="id" value="${payer.id}">
          <input type="text" name="name" id="name" placeholder="Nome" value="${payer.name}" readonly>
          <input type="text" name="cpfCnpj" id="cpfCnpj" placeholder="CPF/CNPJ" value="${payer.cpfCnpj}" readonly>
          <input type="text" name="email" id="email" placeholder="Email" value="${payer.email}" readonly>
          <input type="text" name="phone" id="phone" placeholder="Telefone" value="${payer.phone}" readonly> 
          <input type="text" name="postalCode" id="postalCode" placeholder="CEP" value="${payer.postalCode}" readonly>
          <input type="text" name="address" id="address" placeholder="Endereço" value="${payer.address}" readonly>
          <input type="text" name="addressNumber" id="addressNumber" placeholder="Nº" value="${payer.addressNumber}" readonly>
          <input type="text" name="province" id="province" placeholder="Bairro" value="${payer.province}" readonly >
          <input type="text" name="city" id="city" placeholder="Localidade" value="${payer.city}" readonly>
          <input type="text" name="state" id="state" placeholder="UF" value="${payer.state}" readonly>
          <button class="js-edit">Editar</button>
          <button type="submit" class="js-send-button hide">Salvar</button>
          <button type="reset">Cancelar</button>
        </form>   
      </main>
    <asset:javascript src="utility.applications.js" /> 
    </body>
</html>
