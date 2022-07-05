function ValidateFormController() {
  this.init = function () {
    bindSubmitForm();
    bindInputName();
    bindInputCpfCnpj();
    bindInputEmail();
    bindInputPhone();
    bindInputPostalCode();
    bindInputAddressNumber();
    bindPreventDefaultForm();
  };

  var formReference = document.querySelector("form");
  var nameReference = document.getElementById("name");
  var emailReference = document.getElementById("email");
  var cpfCnpjReference = document.getElementById("cpfCnpj");
  var phoneReference = document.getElementById("phone");
  var postalCodeReference = document.getElementById("postalCode");
  var addressReference = document.getElementById("address");
  var provinceReference = document.getElementById("province");
  var cityReference = document.getElementById("city");
  var stateReference = document.getElementById("state");
  var addressNumberReference = document.getElementById("addressNumber");
  var correctPostalCodeLength = 9;

  function bindPreventDefaultForm() {
    $("form").on("submit", function (e) {
      e.preventDefault();
    });
  }

  function bindSubmitForm() {
    formReference.addEventListener("submit", (event) => {
      validateRequiredsInputs();
    });
  }

  function bindInputName() {
    nameReference.addEventListener("focusout", (event) => {
      validateName();
    });
  }

  function bindInputCpfCnpj() {
    cpfCnpjReference.addEventListener("focusout", (event) => {
      let cpfCnpjValue = cpfCnpjReference.value;
      if (cpfCnpjValue.length == 14) {
        validateCpfValue();
        return;
      }
      validateCnpjValue();
    });
  }

  function bindInputEmail() {
    emailReference.addEventListener("focusout", (event) => {
      validateEmail();
    });
  }

  function bindInputPhone() {
    phoneReference.addEventListener("focusout", (event) => {
      validatePhone();
    });
  }

  function bindInputAddressNumber() {
    addressNumberReference.addEventListener("focusout", (event) => {
      validateAddressNumber();
    });
  }

  function bindInputPostalCode() {
    postalCodeReference.addEventListener("focusout", function () {
      validatePostal();
      if (!validatePostal) {
        setErrorFor(addressReference);
      }
      setSucessFor(addressReference);
      setSucessFor(provinceReference);
      setSucessFor(cityReference);
      setSucessFor(stateReference);
      addressNumberReference.focus();
    });
  }

  function validateCpf(cpf) {
    if (
      !cpf ||
      cpf.length != 11 ||
      cpf == "00000000000" ||
      cpf == "11111111111" ||
      cpf == "22222222222" ||
      cpf == "33333333333" ||
      cpf == "44444444444" ||
      cpf == "55555555555" ||
      cpf == "66666666666" ||
      cpf == "77777777777" ||
      cpf == "88888888888" ||
      cpf == "99999999999"
    )
      return false;

    var add = 0;
    for (i = 0; i < 9; i++) add += parseInt(cpf.charAt(i)) * (10 - i);
    var rev = 11 - (add % 11);
    if (rev == 10 || rev == 11) rev = 0;
    if (rev != parseInt(cpf.charAt(9))) return false;

    add = 0;
    for (i = 0; i < 10; i++) add += parseInt(cpf.charAt(i)) * (11 - i);
    rev = 11 - (add % 11);
    if (rev == 10 || rev == 11) rev = 0;
    if (rev != parseInt(cpf.charAt(10))) return false;
    return true;
  }

  function validateCnpj(cnpj) {
    if (
      !cnpj ||
      cnpj.length != 14 ||
      cnpj == "00000000000000" ||
      cnpj == "11111111111111" ||
      cnpj == "22222222222222" ||
      cnpj == "33333333333333" ||
      cnpj == "44444444444444" ||
      cnpj == "55555555555555" ||
      cnpj == "66666666666666" ||
      cnpj == "77777777777777" ||
      cnpj == "88888888888888" ||
      cnpj == "99999999999999"
    )
      return false;

    var cnpjSize = cnpj.length - 2;
    var cnpjNumber = cnpj.substring(0, cnpjSize);
    var cnpjDigits = cnpj.substring(cnpjSize);
    var cnpjSum = 0;
    var pos = cnpjSize - 7;
    for (i = cnpjSize; i >= 1; i--) {
      cnpjSum += cnpjNumber.charAt(cnpjSize - i) * pos--;
      if (pos < 2) pos = 9;
    }

    cnpjResult = cnpjSum % 11 < 2 ? 0 : 11 - (cnpjSum % 11);
    if (cnpjResult != cnpjDigits.charAt(0)) return false;

    cnpjSize = cnpjSize + 1;
    cnpjNumber = cnpj.substring(0, cnpjSize);
    cnpjSum = 0;
    pos = cnpjSize - 7;
    for (i = cnpjSize; i >= 1; i--) {
      cnpjSum += cnpjNumber.charAt(cnpjSize - i) * pos--;
      if (pos < 2) pos = 9;
    }

    var cnpjResult = cnpjSum % 11 < 2 ? 0 : 11 - (cnpjSum % 11);
    if (cnpjResult != cnpjDigits.charAt(1)) return false;
    return true;
  }

  function validateInputsPostalCode() {
    if (!addressReference.value)
      setErrorFor(addressReference, "O endereço é obrigatório.");
    if (!provinceReference.value)
      setErrorFor(provinceReference, "O  estado é obrigatŕoio.");
    if (!cityReference.value)
      setErrorFor(cityReference, "O cidade é obrigatório.");
    if (!stateReference.value)
      setErrorFor(stateReference, "O estado é obrigatório.");
    return;
  }

  function validateName() {
    let nameValue = nameReference.value;
    if (!nameValue) {
      setErrorFor(nameReference, "O seu nome é obrigatório!");
      return;
    }
    setSucessFor(nameReference);
  }

  function validatePhone() {
    let phoneValue = phoneReference.value;
    if (!phoneValue) {
      setErrorFor(phoneReference, "O seu Telefone é obrigatório!");
      return;
    }
    setSucessFor(phoneReference);
  }

  function validateAddressNumber() {
    let addressNumberValue = addressNumberReference.value;
    if (!addressNumberValue) {
      setErrorFor(addressNumberReference, "O seu Nº é obrigatório!");
      return;
    }
    setSucessFor(addressNumberReference);
  }

  function validateEmail() {
    let emailValue = emailReference.value;
    if (!emailValue) {
      setErrorFor(emailReference, "O email é obrigatório");
      return;
    }
    if (validateFormatEmail(emailValue) != true) {
      setErrorFor(emailReference, "Formato de e-mail incorreto.");
      return;
    }
    setSucessFor(emailReference);
  }

  function validateCpfValue() {
    let cpfCnpjValue = cpfCnpjReference.value;
    cpfCnpjValue = validateFormatCpf(cpfCnpjValue);
    if (validateFormatCpf(cpfCnpjValue) == false) {
      setErrorFor(cpfCnpjReference, "CPF/CNPJ é obrigatório");
      return;
    }
    if (validateCpf(cpfCnpjValue) == false) {
      setErrorFor(cpfCnpjReference, "CPF/CNPJ inválido");
      return;
    }
    setSucessFor(cpfCnpjReference);
  }

  function validateCnpjValue() {
    let cpfCnpjValue = cpfCnpjReference.value;
    cpfCnpjValue = validateFormatCnpj(cpfCnpjValue);
    if (validateFormatCnpj(cpfCnpjValue) == false) {
      setErrorFor(cpfCnpjReference, "CNPJ é obrigatório");
      return;
    }
    if (validateCnpj(cpfCnpjValue) == false) {
      setErrorFor(cpfCnpjReference, "CPF/CNPJ inválido");
      return;
    }
    setSucessFor(cpfCnpjReference);
  }

  function validateFormatCnpj(cnpj) {
    return cnpj.replace(/[^\d]+/g, "");
  }

  function validateFormatCpf(cpf) {
    return cpf.replace(/[^\d]+/g, "");
  }

  function validateFormatEmail(email) {
    if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email)) {
      return true;
    }
    return false;
  }

  function validatePostal() {
    let postalCodeValue = postalCodeReference.value;
    if (!postalCodeValue || postalCodeValue.length != correctPostalCodeLength) {
      setErrorFor(postalCodeReference, "Favor verificar o CEP");
      return;
    }
    setSucessFor(postalCodeReference);
  }

  function validateRequiredsInputs() {
    let cpfCnpjValue = cpfCnpjReference.value;
    if (cpfCnpjValue.length == 14) {
      validateCpfValue();
    } else {
      validateCnpjValue();
    }
    validateName();
    validatePhone();
    validateAddressNumber();
    validatePostal();
    validateInputsPostalCode();
    validateEmail();
    validateFormIsValid();
  }

  function validateFormIsValid() {
    let formControls = formReference.querySelectorAll(".form-controller");
    let formIsValid = [...formControls].every((formControl) => {
      return formControl.className.includes("success");
    });
    if (!formIsValid) return alert("Favor verificar os campos.");
    bindPostFormSubmit();
  }

  function setSucessFor(input) {
    let formControl = input.parentElement;

    $(formControl).addClass("form-controller success").removeClass("error");
  }

  function setErrorFor(input, message) {
    let formControl = input.parentElement;
    let smallDisplayError = formControl.querySelector(".js-msg");

    smallDisplayError.innerText = message;
    $(formControl).addClass("form-controller error").removeClass("success");
  }
  function bindPostFormSubmit() {
    var formReference = $("form");
    var url = formReference.data("url");
    var params = formReference.serialize();

    $.post(url, params, function (response) {
      if (!response.success) {
        alert("Verifique todos os campos.");
        return;
      }
      window.location.href = formReference.data("redirect");
    });
  }
}

var validateFormController;

$(document).ready(function () {
  validateFormController = new ValidateFormController();
  validateFormController.init();
});
