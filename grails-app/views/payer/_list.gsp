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
                    <g:link controller="payer" action="show" update="form" params="${[payerId: payer.id]}">Editar pagador</g:link>
                </td>
            </tr>
        </g:each>
    </tbody>
</table>
