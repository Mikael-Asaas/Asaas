<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <g:set var="entityName" value="${message(code: 'payer.label', default: 'Payer')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <asset:javascript src="application.js" />
    </head>
    <body>
    <main class="container">
      <h2 class="h2">Novo Pagador</h2>
      <form action="${g.createLink(controller: 'payer', action: 'save')}">
        <input type="text" name="nome" placeholder="Nome">
        <input type="text" name="cpf" placeholder="CPF/CNPJ">
        <input type="text" name="email" placeholder="Email">
        <input type="text" name="telefone" placeholder="Telefone">
        <input type="text" name="cep" placeholder="CEP">
        <input type="text" name="endereco" placeholder="Endereço">
        <input type="text" name="numero" placeholder="Nº">
        <input type="text" name="bairro" placeholder="Bairro">
        <input type="text" name="cidade" placeholder="Localidade">
        <input type="text" name="estado" placeholder="UF">
        <button type="submit">Criar</button>
      </form>   
    </main>
    <asset:javascript src="payer/payerSave.js" />
    </body>
</html> 

