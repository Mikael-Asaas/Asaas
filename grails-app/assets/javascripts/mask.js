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

const phoneReferencie = document.querySelector("#phone");
phoneReferencie.addEventListener("keypress", () => {
  let inputlenght = phoneReferencie.value.length;

  if (inputlenght == 0) {
    phoneReferencie.value += "(";
  } else if (inputlenght == 3) {
    phoneReferencie.value += ")";
  } else if (inputlenght == 5) {
    phoneReferencie.value += " ";
  } else if (inputlenght == 10) {
    phoneReferencie.value += "-";
  }
});

const inputpostalCode = document.querySelector("#postalCode");
inputpostalCode.addEventListener("keypress", () => {
  let inputlenght = inputpostalCode.value.length;

  if (inputlenght == 5) {
    inputpostalCode.value += "-";
  }
});