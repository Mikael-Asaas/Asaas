<!doctype html>
<html lang="en" class="no-js">
<head>
    <script
      src="https://kit.fontawesome.com/c8d140aaae.js" crossorigin="anonymous">
    </script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
    <asset:javascript src="application.js"/>
    <asset:stylesheet src="sideNavegation.css" />
    <asset:stylesheet src="application.css"/>
    <g:layoutHead/>
</head>
<body>
    
    <g:render template="/utils/sidebar" model="[customer: customer]" />
    <div class="container-body">
        <g:layoutBody/>
    </div>
</body>
</html>