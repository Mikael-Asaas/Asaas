<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'payment.label', default: 'Payment')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
    <asset:javascript src="application.js" />
    <title>Cobranças</title>
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
        <g:each var="payment" in="${ paymentList }">
            <tr>
                <td>${payment.name}</td>
                <td>${payment.email}</td>
            </tr>
                <tr>
                    <td>
                        <a href="${ g.createLink(controller:'payment', action: 'show', id: payment.id)}">Editar cobrança</a>
                    </td>
                </tr>
        </g:each>
    </tbody>
    </table>
</body>
