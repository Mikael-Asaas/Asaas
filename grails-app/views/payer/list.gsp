<head>
    <meta name="layout" content="" />
    <asset:stylesheet src="index/listPayer"/>
    <title>Listagem Payer</title>
</head>
<body>
    
 <g:each var="item" in="${ payerList }">
    <div class="item-payerList">
        Nome: ${item.nome}
    </div>
    <div>
        Email: ${item.email}
    </div>
</g:each>

</body>
</html>

