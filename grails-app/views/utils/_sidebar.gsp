<div class="sidebar">
    <div class="logo_content">
        <div class="logo">
            <i class="fa-solid fa-rocket"></i>
            <div class="logo_name">AsaasProject</div>
        </div>
        <i class="fa-solid fa-bars" id="btn"></i>
    </div>
    <ul class="nav_list">
        <li>
            <g:link controller="payment" action="create">
            <i class="fa-solid fa-chart-line"></i>
            <span class="links_name">Dashboard</span>
            </g:link>
            <span class="tooltips">Dashboard</span>
        </li>
        <li>
            <g:link controller="payment" action="create">
            <i class="fa-solid fa-money-check-dollar"></i>
            <span class="links_name">Criar cobrança</span>
            </g:link>
            <span class="tooltips">Criar cobrança</span>
        </li>
        <li>
            <g:link controller="payment" action="create">
            <i class="fa-solid fa-clipboard-list"></i>
            <span class="links_name">Minhas cobranças</span>
            </g:link>
            <span class="tooltips">Cobranças</span>
        </li>
        <li>
            <g:link controller="payment" action="create">
            <i class="fa-solid fa-address-book"></i>
            <span class="links_name">Cadastrar cliente</span>
            </g:link>
            <span class="tooltips">Novo cliente</span>
        </li>
        <li>
            <g:link controller="payment" action="create">
            <i class="fa-solid fa-circle-user"></i>
            <span class="links_name">Meus dados</span>
            </g:link>
            <span class="tooltips">Meus dados</span>
        </li>
        <li>
            <g:link controller="payment" action="create">
            <i class="fa-solid fa-arrow-right-from-bracket" id="log_out"></i>
            <span class="links_name">Sair</span>
            </g:link>
            <span class="tooltips">Sair</span>
        </li>
    </ul>
</div>
<asset:javascript src="sideNavegation.js"/> 
