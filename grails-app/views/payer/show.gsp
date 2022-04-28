<html>
    <head>
        <meta name="layout" content="main"/>
        <g:set var="entityName" value="${message(code: 'payer.label', default: 'Payer')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <asset:javascript src="application.js" />
        <title>Editar Pagador</title>
    </head>
    <body>
    <main class="container">
      <h2 class="h2">Editar Pagador</h2>
      <form data-url-redirect="${g.createLink(controller: 'payer', action: 'index')}"
            action="${g.createLink(controller: 'payer', action: 'update')}" readonly>
        <input type="hidden" class="js-payer-id" name="id" value="${payer.id}">
        <input type="text" name="name" id="name" placeholder="Nome" value="${payer.name}" readonly>
        <input type="text" name="cpf" id="cpf" placeholder="CPF/CNPJ" value="${payer.cpf}" readonly>
        <input type="text" name="email" id="email" placeholder="Email" value="${payer.email}" readonly>
        <input type="text" name="telephone" id="telephone" placeholder="Telefone" value="${payer.telephone}" readonly> 
        <input type="text" name="cep" id="cep" placeholder="CEP" value="${payer.cep}" readonly>
        <input type="text" name="address" id="address" placeholder="Endereço" value="${payer.address}" readonly>
        <input type="text" name="number" id="number" placeholder="Nº" value="${payer.number}" readonly>
        <input type="text" name="district" id="district" placeholder="Bairro" value="${payer.district}" readonly >
        <input type="text" name="city" id="city" placeholder="Localidade" value="${payer.city}" readonly>
        <input type="text" name="state" id="state" placeholder="UF" value="${payer.state}" readonly>
        <button class="js-edit">Editar</button>
        <button type="submit" class="js-send-button hide">Salvar</button>
        <button type="reset">Cancelar</button>
      </form>   
    </main>
    <asset:javascript src="payer.js" /> 
    </body>
</html>
