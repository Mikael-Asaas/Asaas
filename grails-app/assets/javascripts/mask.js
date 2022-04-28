function Mask(o, f) {
  v_obj = o;
  v_fun = f;
  setTimeout("execmascara()", 1);
}

function execmascara() {
  v_obj.value = v_fun(v_obj.value);
}

function cpfCnpj(v) {
  v = v.replace(/\D/g, "");

  if (v.length <= 14) {
    v = v.replace(/(\d{3})(\d)/, "$1.$2");

    v = v.replace(/(\d{3})(\d)/, "$1.$2");

    v = v.replace(/(\d{3})(\d{1,2})$/, "$1-$2");
  } else {
    v = v.replace(/^(\d{2})(\d)/, "$1.$2");

    v = v.replace(/^(\d{2})\.(\d{3})(\d)/, "$1.$2.$3");

    v = v.replace(/\.(\d{3})(\d)/, ".$1/$2");

    v = v.replace(/(\d{4})(\d)/, "$1-$2");
  }

  return v;
}

const inputTelReference = document.querySelector("#telephone");
inputTelReference.addEventListener("keypress", () => {
  let inputlenght = inputTelReference.value.length;

  if (inputlenght == 0) {
    inputTelReference.value += "(";
  } else if (inputlenght == 3) {
    inputTelReference.value += ")";
  } else if (inputlenght == 5) {
    inputTelReference.value += " ";
  } else if (inputlenght == 10) {
    inputTelReference.value += "-";
  }
});

const inputcep = document.querySelector("#cep");
inputcep.addEventListener("keypress", () => {
  let inputlenght = inputcep.value.length;

  if (inputlenght == 5) {
    inputcep.value += "-";
  }
});