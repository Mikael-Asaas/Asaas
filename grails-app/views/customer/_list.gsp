
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
    <asset:javascript src="application.js"/>
    <title>Clientes</title>
</head>
<body>
    <table>
        <thead>
            <tr>
                <th>Nome</th>
                <th>E-mail</th>
            </tr>
        </thead>
    <tbody>
         <g:each var="customer" in="${ customerList }">
            <tr>
                <td>${customer.name}</td>
                <td>${customer.email}</td>                          
            </tr>
                <tr>
                    <td>
                        <g:link controller="customer" action="show" id='${customer.id}'><button>Editar cliente</button></g:link>
                        <g:link controller="payer" action="create" id='${customer.id}'><button>Criar pagador</button></g:link>
                        <g:link controller="payment" action="create" id='${customer.id}'><button>Criar cobrança</button></g:link>
                    </td>
                </tr> 
         </g:each> 
    </tbody>
    </table> 
</body>  
