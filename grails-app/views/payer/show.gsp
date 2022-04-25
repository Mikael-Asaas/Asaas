<!DOCTYPE html>
<html>
    <head>
     <asset:javascript src="application.js" />
    </head>
    <body>
      <form action="${g.createLink(controller: 'payer', action: 'save')}" readonly>
        <input type="hidden" class="js-payer-id" name="id" value="1">
        <input type="text" name="nome" placeholder="Nome" value="${payer.nome}" readonly>
        <input type="text" name="cpf" placeholder="CPF/CNPJ" value="${payer.cpf}" readonly>
        <input type="text" name="email" placeholder="Email" value="${payer.email}" readonly>
        <input type="text" name="telefone" placeholder="Telefone" value="${payer.telefone}" readonly> 
        <input type="text" name="cep" placeholder="CEP" value="${payer.cep}" readonly>
        <input type="text" name="endereco" placeholder="Endereço" value="${payer.endereco}" readonly>
        <input type="text" name="numero" placeholder="Nº" value="${payer.numero}" readonly>
        <input type="text" name="bairro" placeholder="Bairro" value="${payer.bairro}" readonly >
        <input type="text" name="cidade" placeholder="Localidade" value="${payer.cidade}" readonly>
        <input type="text" name="estado" placeholder="UF" value="${payer.estado}" readonly>
        <button class="js-edit">Editar</button>
        <button type="submit" class="js-send-button hide">Salvar</button>
      </form>   
      <asset:stylesheet src="payer/payerHide.css" />
      <asset:javascript src="payer/payerSave.js" />
      <asset:javascript src="payer/payerShow.js" />   
    </body>
</html>
