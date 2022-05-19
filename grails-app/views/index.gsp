<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
    <asset:stylesheet src="index/IndexCss.css" />
    <asset:javascript src="application.js" />
    <title>Asaas - Criar conta</title>
  </head>
  <body>
    <main class="container">
      <h2 class="h2">Registro</h2>
      <form autocomplete="off" id="formid" class="form"> 
        <div class="input-field">
          <input type="text" name="name" id="name" placeholder="Nome" required/>
          <div class="linha"></div>
        </div>

        <div class="input-field">
          <input type="text" name="cpfCnpj" id="cpfcnpj" placeholder="CPF/CNPJ" required/>
          <div class="linha"></div>
        </div>

        <div class="input-field">
          <input type="email" name="email" id="email" placeholder="Email" required/>
          <div class="linha"></div>
        </div>

        <div class="input-field">
          <input type="text" name="phone" id="phone" placeholder="Telefone" maxlength="16" required/>
          <div class="linha"></div>
        </div>

        <div class="input-field">
          <input type="text" name="postalCode" id="postalCode" placeholder="CEP" maxlength="9" required/>
          <div class="linha"></div>
        </div>

        <div class="input-field">
          <input type="text" name="address" id="address"  placeholder="Endereço" required/>
          <div class="linha"></div>
        </div>

        <div class="input-field">
          <input type="text" name="addressNumber" id="addressNumber" placeholder="Nº" required/>
          <div class="linha"></div>
        </div>

        <div class="input-field">
          <input type="text" name="province" id="province" placeholder="Bairro" required/>
          <div class="linha"></div>
        </div>

        <div class="input-field">
          <input type="text" name="state" id="state" placeholder="UF" required/>
          <div class="linha"></div>
        </div>

        <button type="submit" id="send" class="btn">Registrar</button>
      </form>   
    </main>
    <asset:javascript src="index.js" />
  </body>
</html> 
