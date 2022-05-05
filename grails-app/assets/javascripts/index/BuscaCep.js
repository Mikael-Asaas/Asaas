const ClearForm = () => {
  document.getElementById("address").value = "";
  document.getElementById("province").value = "";
  document.getElementById("city").value = "";
  document.getElementById("state").value = "";
  document.getElementById("addressNumber").value = "";
};

const preencherForm = (address) => {
  document.getElementById("address").value = address.logradouro;
  document.getElementById("province").value = address.bairro;
  document.getElementById("city").value = address.localidade;
  document.getElementById("state").value = address.uf;
};

const postalCodeValido = function (postalCode) {
  return postalCodePattern = /^[0-9]{8}$/.test(postalCode);
  
};

const pesquisarpostalCode = async () => {
  ClearForm();
  let postalCode = document.getElementById("postalCode").value.replace("-", "");
  let url = `https://viacep.com.br/ws/${postalCode}/json/`;
  if (postalCodeValido(postalCode)) {
    let dados = await fetch(url);
    let address = await dados.json();
    if (address.hasOwnProperty("erro")) {
      document.getElementById("address").value = "postalCode não encontrado";
    } else {
      preencherForm(address);
    }
  } else {
    document.getElementById("address").value = "postalCode incorreto!";
  }
};

document.getElementById("postalCode").addEventListener("focusout", pesquisarpostalCode);