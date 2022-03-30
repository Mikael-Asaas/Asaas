
document.querySelector("#formid").addEventListener("submit", function(event){
event.preventDefault();

  const nome = document.getElementById("nome")
  const cpf = document.getElementById("cpf")
  const email = document.getElementById("email")
  const telefone = document.getElementById("telefone")
  const cep = document.getElementById("cep")
  const endereco = document.getElementById("endereco")
  const numero = document.getElementById("numero")
  const bairro = document.getElementById("bairro")
  const localidade = document.getElementById("localidade")
  const uf = document.getElementById("uf")
  

  console.log(infoReturn());

  alert("Formulario Enviado!");

  document.getElementById("nome").value = "";
  document.getElementById("cpf").value = "";
  document.getElementById("email").value = "";
  document.getElementById("telefone").value = "";
  document.getElementById("cep").value = "";
  document.getElementById("endereco").value = "";
  document.getElementById("bairro").value = "";
  document.getElementById("localidade").value = "";
  document.getElementById("uf").value = "";
  document.getElementById("numero").value = "";
});

function infoReturn() {
  return {
    nome: nome.value,
    cpf: cpf.value,
    telefone: telefone.value,
    cep: cep.value,
    endereco: endereco.value,
    numero: numero.value,
    bairro: bairro.value,
    localidade: localidade.value,
    uf: uf.value,
  }
}
