<!DOCTYPE html>
<html>
    <head>
      <style>
        .hide {
          display:none;
        }
      </style>
    </head>
    <body>
      <form autocomplete="off" id="formid" class="form" action="${ g.createLink(controller: 'payer', action: 'save') }" readonly >
        <div class="input-field">
          <input type="text" name="nome" id="nome" placeholder="Nome" required value="${payer.nome}" readonly/>
        </div>

        <div class="input-field">
          <input type="text" name="cpf" id="cpfcnpj" placeholder="CPF/CNPJ" onkeypress='Mask(this,cpfCnpj)' onblur='clearTimeout()' required value="${payer.cpf}" readonly/>
        </div>

        <div class="input-field">
          <input type="email" name="email" id="email" placeholder="Email" required value="${payer.email}" readonly/>
        </div>

        <div class="input-field">
          <input type="text" name="telefone" id="telefone" placeholder="Telefone" maxlength="15" required value="${payer.telefone}" readonly/>
        </div>

        <div class="input-field">
          <input type="text" name="cep" id="cep" placeholder="CEP" maxlength="9" required value="${payer.cep}" readonly/>
        </div>

        <div class="input-field">
          <input type="text" name="endereco" id="endereco"  placeholder="Endereço" required value="${payer.endereco}" readonly/>
        </div>

        <div class="input-field">
          <input type="text" name="numero" id="numero" placeholder="Nº" required value="${payer.numero}" readonly/>
        </div>

        <div class="input-field">
          <input type="text" name="bairro" id="bairro" placeholder="Bairro" required value="${payer.bairro}" readonly/>
        </div>

        <div class="input-field">
          <input type="text" name="cidade" id="cidade" placeholder="Localidade" required value="${payer.cidade}" readonly/>
        </div>

        <div class="input-field">
          <input type="text" name="estado" id="estado" placeholder="UF" required value="${payer.estado}" readonly/>
        </div>

        <button class="js-edit">Editar</button>
        <button type="submit" class="hide">Salvar</button>
      </form>   
      <script>
      
      </script>
    </body>
</html>