<html>
    <head>
        <meta name="layout" content="main"/>
        <g:set var="entityName" value="${message(code: 'payer.label', default: 'Payer')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <asset:javascript src="application.js" />
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
            <tbody>
                <g:each var="payer" in="${ payerList }">
                    <tr>
                        <td>${payer.name}</td>
                        <td>${payer.email}</td>                          
                    </tr>
                    <tr>
                        <td>
                            <a href="${ g.createLink(controller: 'payer', action: 'show', id: payer.id)}">Editar pagador</a>
                        </td>
                    </tr> 
                </g:each>
            </tbody>
        </table>
    </body>
</html>
