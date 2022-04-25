<head>
    <meta name="layout" content="main" />
    <title>Pagadores</title>
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
        <g:each var="payer" in="${ payerList }">
            <div>
                <tr>
                    <td>${payer.nome}</td>
                    <td>${payer.email}</td>                          
                </tr>
                <tr>
                    <td>
                        <a href="${ g.createLink(controller: 'payer', action: 'show', id: payer.id)}">Editar pagador</a>
                    </td>
                </tr>
             </div>  
        </g:each>
    </tbody>
</body>

