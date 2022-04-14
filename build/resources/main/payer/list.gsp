<head>
    <meta name="layout" content="" />
    <asset:stylesheet src="index/listPayer"/>
    <title>Listagem Payer</title>
</head>
<body>
    
 <g:each var="item" in="${ payerList }">
   <div class="item-payerList">NOME: ${item.nome}</div>
   <div>CPF/CNPJ:${item.cpf}</div>
   <div>EMAIL: ${item.email}</div>
   <div>TELEFONE: ${item.telefone}</div>
   <div>CEP: ${item.cep}</div>
   <div>ENDEREÇO: ${item.endereco}</div>
   <div>Nº: ${item.Nº}</div>
   <div>BAIRRO: ${item.bairro}</div>
   <div>CIDADE: ${item.cidade}</div>
   <div>ESTADO: ${item.uf}</div>


</g:each>

</body>
</html>

