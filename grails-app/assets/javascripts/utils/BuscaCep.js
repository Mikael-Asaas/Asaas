const cepValido = function (cep) {
  return /^[0-9]{8}$/.test(cep);
};

const cepVerify = function (cep) {
  return cep.replace(/\D/g, "");
};

const pesquisarCep = async (cep, callbackfunction,) => {
  if(cepVerify(cep).length == 8){
    let url = `https://viacep.com.br/ws/${cep}/json/`;
    let dados = await fetch(url);
    let address = await dados.json();
    callbackfunction(address);
  };
};
