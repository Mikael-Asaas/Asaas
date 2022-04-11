<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <link rel="shortcut icon" type="image/x-icon" href="/images/favicon.ico" />
    <asset:stylesheet src="index/IndexCss.css" />
    <title>Asaas - Criar conta</title>
    

  </head>
  <body>
    <main class="container">
      <h2 class="h2">Registro</h2>
      <form autocomplete="off" id="formid" class="form"> 
        <div class="input-field">
          <input type="text" name="nome" id="nome" placeholder="Nome" required/>
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
          <input type="text" name="telefone" id="telefone" placeholder="Telefone" maxlength="15" required/>
          <div class="linha"></div>
        </div>

        <div class="input-field">
          <input type="text" name="cep" id="cep" placeholder="CEP" maxlength="9" required/>
          <div class="linha"></div>
        </div>

        <div class="input-field">
          <input type="text" name="endereco" id="endereco"  placeholder="Endereço" required/>
          <div class="linha"></div>
        </div>

        <div class="input-field">
          <input type="text" name="numero" id="numero" placeholder="Nº" required/>
          <div class="linha"></div>
        </div>

        <div class="input-field">
          <input type="text" name="bairro" id="bairro" placeholder="Bairro" required/>
          <div class="linha"></div>
        </div>

        <div class="input-field">
          <input type="text" name="localidade" id="localidade" placeholder="Localidade" required/>
          <div class="linha"></div>
        </div>

        <div class="input-field">
          <input type="text" name="uf" id="uf" placeholder="UF" required/>
          <div class="linha"></div>
        </div>

      
        <button type="submit" id="send" class="btn" >Registrar</button>
      
      </form>   
    </main>

    <asset:javascript src="mask.js" />
    <asset:javascript src="index/IndexController.js" />
    <asset:javascript src="index/BuscaCep.js" />
   
  </body>
</html> 