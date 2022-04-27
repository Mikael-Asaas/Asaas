<!DOCTYPE html>
<html>
  <head>
      <asset:javascript src="application.js" />
  </head>
    <body>
      <form data-url-redirect="${g.createLink(controller: 'customer', action 'index')}"
            action="${g.createLink(controller: 'customer', action: 'update')}" readonly>        
        <input type="hidden" class="js-customer-id" name="id" value="${customer.id}">
        <input type="text" name="name" placeholder="Nome" value="${customer.name}" readonly>
        <input type="text" name="cpf" placeholder="CPF/CNPJ" value="${customer.cpf}" readonly>
        <input type="text" name="email" placeholder="Email" value="${customer.email}" readonly>
        <input type="text" name="telephone" placeholder="Telefone" value="${customer.telephone}" readonly> 
        <input type="text" name="cep" placeholder="CEP" value="${customer.cep}" readonly>
        <input type="text" name="address" placeholder="Endereço" value="${customer.address}" readonly>
        <input type="text" name="number" placeholder="Nº" value="${customer.number}" readonly>
        <input type="text" name="district" placeholder="Bairro" value="${customer.district}" readonly >
        <input type="text" name="city" placeholder="Localidade" value="${customer.city}" readonly>
        <input type="text" name="state" placeholder="UF" value="${customer.state}" readonly>
        <button class="js-edit">Editar</button>
        <button type="submit" class="js-send-button hide">Salvar</button>
      </form>

       <asset:stylesheet src="customer/customerHide.css" />
       <asset:javascript src="customer/customerSave.js" />
       <asset:javascript src="customer/customerShow.js" />   
   
    </body>
</html>