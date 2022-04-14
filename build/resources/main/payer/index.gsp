<!DOCTYPE html>
<html>

    <head>
        
        <asset:stylesheet src="/index/indexPayer.css"/>
        <meta name="layout" content="menuLayout" />
        
    </head>
    <body>
    
    <main class="container">
      <h2 class="h2">Adicionar Cliente</h2>
      <form autocomplete="off" id="formid" class="form" action="${ g.createLink(controller: 'payer', action: 'save') }"> 
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

    </body>
</html>