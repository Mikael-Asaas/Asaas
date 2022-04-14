<!doctype html>
<html lang="en" class="no-js">
<head>
    
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Asaas"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
    <asset:stylesheet src="/index/menuLayout.css"/>
    <g:layoutHead/>
</head>

<body>
    <main class="menu">
        <div class="navigation">
            <ul>
                <li class="list active">
                    <a href="#">
                        <span class="icon"><ion-icon name="add-outline"></ion-icon><span>
                        <span class="title">Criar Cobrança</span>
                    </a>
                </li>
                <li class="list">
                    <a href="#">
                    <span class="icon"><ion-icon name="cash-outline"></ion-icon><span>
                        <span class="title">Cobranças</span>
                    </a>
                </li>
                <li class="list">
                    <a href="http://localhost:8080/payer/list">
                        <span class="icon"><ion-icon name="people-outline"></ion-icon><span>
                        <span class="title">Meus Clientes</span>
                    </a>
                </li>
                <li class="list">
                    <a href="#">
                        <span class="icon"><ion-icon name="file-tray-full-outline"></ion-icon><span>
                        <span class="title">Messagens</span>
                    </a>
                </li>
                <div class="down">
                    <li class="list">
                        <a href="#">
                            <span class="icon"><ion-icon name="settings-outline"></ion-icon><span>
                            <span class="title">Configurações</span>
                        </a>
                    </li>
                    <li class="list">
                        <a href="http://localhost:8080/">
                            <span class="icon"><ion-icon name="exit-outline"></ion-icon><span>
                            <span class="title">Sair</span>
                        </a>
                    </li>
                </div>
            </ul>
        </div>
        <g:layoutBody/>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    </main>
</body>
</html>