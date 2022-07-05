
<html>
  <head>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
    <asset:stylesheet src="index/IndexCss.css" />
    <asset:javascript src="application.js" />
    <asset:javascript src="utils/confirmPassword"/>
    <title>Asaas - Login </title>
  </head>
<body>
  <main class="container">
    <h2 class="h2">Acesso ao Asaas</h2>
    <form id="formid" class="form" action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" autocomplete="off">
     
      <div class="input-field">
        <input type="text" name="${usernameParameter ?: 'username'}" id="username" placeholder="Email" autocapitalize="none"/>
        <div class="linha"></div>
      </div>
      
      <div class="input-field">
        <input type="password" name="${passwordParameter ?: 'password'}" id="password" placeholder="Senha"/>
        <i id="passwordToggler" title="toggle password display" onclick="passwordDisplayToggle()">&#128065;</i>
        <div class="linha"></div>
      
      </div>
      <button class="btn" id="login" type="submit">Acessar sua conta</button>
      <br>
      <p>Ainda não tem uma conta? </p>
      <g:link controller="register">Criar conta</g:link>
    </form>
  </main>
</body>
</html>