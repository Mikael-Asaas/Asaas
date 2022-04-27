const ClearForm = (address) => {
  document.getElementById("address").value = "";
  document.getElementById("district").value = "";
  document.getElementById("city").value = "";
  document.getElementById("state").value = "";
  document.getElementById("number").value = "";
};

const preencherForm = (address) => {
  document.getElementById("address").value = address.logradouro;
  document.getElementById("district").value = address.bairro;
  document.getElementById("city").value = address.localidade;
  document.getElementById("state").value = address.uf;
};

const cepValido = function (cep) {
  return cepPattern = /^[0-9]{8}$/.test(cep);
  
};

const pesquisarCep = async () => {
  ClearForm();
  let cep = document.getElementById("cep").value.replace("-", "");
  let url = `https://viacep.com.br/ws/${cep}/json/`;
  if (cepValido(cep)) {
    let dados = await fetch(url);
    let address = await dados.json();
    if (address.hasOwnProperty("erro")) {
      document.getElementById("address").value = "CEP não encontrado";
    } else {
      preencherForm(address);
    }
  } else {
    document.getElementById("address").value = "CEP incorreto!";
  }
};

document.getElementById("cep").addEventListener("focusout", pesquisarCep);