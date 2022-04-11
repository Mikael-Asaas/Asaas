const ClearForm = (endereco) => {
  document.getElementById("endereco").value = "";
  document.getElementById("bairro").value = "";
  document.getElementById("localidade").value = "";
  document.getElementById("uf").value = "";
  document.getElementById("numero").value = "";
};

const preencherForm = (endereco) => {
  document.getElementById("endereco").value = endereco.logradouro;
  document.getElementById("bairro").value = endereco.bairro;
  document.getElementById("localidade").value = endereco.localidade;
  document.getElementById("uf").value = endereco.uf;
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
    let endereco = await dados.json();
    if (endereco.hasOwnProperty("erro")) {
      document.getElementById("endereco").value = "CEP não encontrado";
    } else {
      preencherForm(endereco);
    }
  } else {
    document.getElementById("endereco").value = "CEP incorreto!";
  }
};

document.getElementById("cep").addEventListener("focusout", pesquisarCep);