<html>
  <head>
  
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
    <asset:stylesheet src="index/IndexCss.css" />
    <asset:javascript src="application.js" />
    <title>Cadastrar conta</title>
  </head>
<body>
  <main class="container">
    <h2 class="h2">Registrar aqui</h5>
      <g:if test='${flash.message}'>
          <div class="alert alert-danger" role="alert">${flash.message}</div>
      </g:if>
      <form id="formid" class="form" action="register" method="POST" id="loginForm" autocomplete="off">

        <div class="input-field">
          <input type="email" name="username" id="username" placeholder="Email" autocapitalize="none"/>
          <div class="linha"></div>
        </div>

        <div class="input-field">
          <input type="password" name="password" id="password" placeholder="Senha" required/>
          <div class="linha"></div>
        </div>

        <div class="input-field">
          <input type="password" name="repassword" id="repassword" placeholder="Confirmar senha" required/>
          <div class="linha"></div>
        </div>

        <button id="submit" type="submit" class="btn">Criar conta</button>
        <br>
        <p>Já tem uma conta?</p>
        <g:link controller="login" action="auth">Entrar</g:link>
    </form>
  </main>
</body>
</html>