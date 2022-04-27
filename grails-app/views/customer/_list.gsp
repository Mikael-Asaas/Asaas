
<head>
    <meta name="layout" content="main" />
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
    </table>
    <tbody>
        <g:each var="customer" in ="${ customerList }">
            <div>
                <tr>
                    <td>${customer.name}</td>
                    <td>${customer.email}</td>                          
                </tr>
                <tr>
                    <td>
                        <a href="${ g.createLink(controller: 'customer', action: 'show', id: customer.id)}">Editar Cliente</a>
                    </td>
                </tr>
             </div>  
        </g:each>
    </tbody>
</body>