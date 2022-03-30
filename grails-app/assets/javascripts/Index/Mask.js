const inputcpf = document.querySelector("#cpf");
inputcpf.addEventListener("keypress", () => {
  let inputlenght = inputcpf.value.length;

  if (inputlenght == 3 || inputlenght == 7) {
    inputcpf.value += ".";
  } else if (inputlenght == 11) {
    inputcpf.value += "-";
  }
});

const inputtell = document.querySelector("#telefone");
inputtell.addEventListener("keypress", () => {
  let inputlenght = inputtell.value.length;

  if (inputlenght == 0) {
    inputtell.value += "(";
  } else if (inputlenght == 3) {
    inputtell.value += ")";
  } else if (inputlenght == 5) {
    inputtell.value += " ";
  } else if (inputlenght == 10) {
    inputtell.value += "-";
  }
});

const inputcep = document.querySelector("#cep");
inputcep.addEventListener("keypress", () => {
  let inputlenght = inputcep.value.length;

  if (inputlenght == 5) {
    inputcep.value += "-";
  }
});
