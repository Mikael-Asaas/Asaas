const formReference = document.getElementById("formid");
const nome = document.getElementById("nome");
const cpf = document.getElementById("cpfcnpj");
const email = document.getElementById("email");
const telefone = document.getElementById("telefone");
const cep = document.getElementById("cep");
const endereco = document.getElementById("endereco");
const numero = document.getElementById("numero");
const bairro = document.getElementById("bairro");
const localidade = document.getElementById("localidade");
const uf = document.getElementById("uf");

formReference.addEventListener("submit", (event) => {
  event.preventDefault();
  var customer = {};
  var form = document.querySelector("form");
  var data = new FormData(form);
  data.forEach(function (value, key) {
    customer[key] = value;
  });

  console.log(customer);
  formReference.reset();
  alert("Formulario Enviado!");
});