<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
    <asset:javascript src="application.js" />
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
                ${customer.name}</td>
                ${customer.email}</td>                          
            </tr>
                <tr>
                    <td>
                        <a href="${ g.createLink(controller: 'customer', action: 'show', id: customer.id)}">Editar Cliente</a>
                    </td>
                </tr> 
         </g:each> 
    </tbody>
    </table> 
</body>  