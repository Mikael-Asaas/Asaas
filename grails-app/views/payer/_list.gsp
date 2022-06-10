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
                <td>
                    <a href="${ g.createLink(controller: 'payer', action: 'show', id: payer.id)}">Editar pagador</a>
                </td>
            </tr>
        </g:each>
    </tbody>
</table>
