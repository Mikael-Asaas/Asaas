<html>
<head>
    <meta name="layout" content="${gspLayout ?: 'main'}"/>
    <title>Register</title>
</head>

<body>
    <div class="row">
    <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
      <div class="card card-signin my-5">
        <div class="card-body">
          <h5 class="card-title text-center">Cadastra-se</h5>
                    <g:if test='${flash.message}'>
                        <div class="alert alert-danger" role="alert">${flash.message}</div>
                    </g:if>
              <form class="form-signin" action="register" method="POST" id="loginForm" autocomplete="off">

            <div class="form-group">
                <label for="username">Usuário</label>
                <input type="text" placeholder="Seu usuário" class="form-control" name="username" id="username" autocapitalize="none"/>
            </div>

            <div class="form-group">    
                <label for="email">E-mail</label>
                <input type="text" placeholder="Seu e-mail" class="form-control" name="email" id="email" autocapitalize="none"/>
            </div>

            <div class="form-group">
                <label for="password">Senha</label>
                <input type="password" placeholder="Sua senha" class="form-control" name="password" id="password"/>
            </div>

            <div class="form-group">
                <label for="password">Confirmar senha</label>
                <input type="password" placeholder="Confirme sua senha" class="form-control" name="repassword" id="repassword"/>
            </div>

            <button id="submit" class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Criar conta</button>
            <hr class="my-4">
            <p>Já tem uma conta? <g:link controller="login" action="auth">Entrar</g:link></p>
          </form>
        </div>
      </div>
    </div>
  </div>
    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function(event) {
            document.forms['loginForm'].elements['username'].focus();
        });
    </script>
</body>
</html>