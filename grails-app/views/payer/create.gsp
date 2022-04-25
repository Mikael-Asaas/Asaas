<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
    <main class="container">
      <h2 class="h2">Novo Pagador</h2>
      <form autocomplete="off" id="formid" class="form" action="${ g.createLink(controller: 'payer', action: 'save') }">
        <div class="input-field">
          <input type="text" name="name" id="name" placeholder="Nome" required/>
          <div class="linha"></div>
        </div>

        <div class="input-field">
          <input type="text" name="cpf" id="cpfcnpj" placeholder="CPF/CNPJ" onkeypress='Mask(this,cpfCnpj)' onblur='clearTimeout()' required />
          <div class="linha"></div>
        </div>

        <div class="input-field">
          <input type="email" name="email" id="email" placeholder="Email" required/>
          <div class="linha"></div>
        </div>

        <div class="input-field">
          <input type="text" name="telephone" id="telephone" placeholder="Telefone" maxlength="15" required/>
          <div class="linha"></div>
        </div>

        <div class="input-field">
          <input type="text" name="cep" id="cep" placeholder="CEP" maxlength="9" required/>
          <div class="linha"></div>
        </div>

        <div class="input-field">
          <input type="text" name="address" id="address"  placeholder="Endereço" required/>
          <div class="linha"></div>
        </div>

        <div class="input-field">
          <input type="text" name="number" id="number" placeholder="Nº" required/>
          <div class="linha"></div>
        </div>

        <div class="input-field">
          <input type="text" name="district" id="district" placeholder="Bairro" required/>
          <div class="linha"></div>
        </div>

        <div class="input-field">
          <input type="text" name="city" id="city" placeholder="Localidade" required/>
          <div class="linha"></div>
        </div>

        <div class="input-field">
          <input type="text" name="state" id="state" placeholder="UF" required/>
          <div class="linha"></div>
        </div>

        <button type="submit" id="send" class="btn" >Adicionar Pagador</button>
      </form>   
    </main>
    <asset:javascript src="index/BuscaCep.js" /> 
    </body>
</html>