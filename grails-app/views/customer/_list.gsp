
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
                       <g:link controller="customer" action="show" update="form" params="${[customerId: customer.id]}">Editar cliente</g:link>
                    </td>
                </tr> 
         </g:each> 
    </tbody>
    </table> 
</body>  
