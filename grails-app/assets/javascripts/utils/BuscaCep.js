const cepValido = function (cep) {
  return /^[0-9]{8}$/.test(cep);
};

const pesquisarCep = async (cep, callbackfunction) => {
  let url = `https://viacep.com.br/ws/${cep}/json/`; 
    let dados = await fetch(url);
    let address = await dados.json();
    callbackfunction(address)
};
