function PaymentFormValidateController() {
  this.init = function () {
    bindSubmitForm();
    bindInputValue();
    bindInputDueDate();
    bindInputMethod();
    bindSelectPayer();
    bindPreventDefaultForm();
  };

  var formReference = document.querySelector("form");
  var valueReference = document.getElementById("value");
  var dueDateReference = document.getElementById("dueDate");
  var methodReference = document.getElementById("method");
  var payerReference = document.getElementById("payerId");
  var todayDate = new Date();
  var zeroValue = 0;
  var minValue = 5;

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

  function bindInputValue() {
    valueReference.addEventListener("focusout", (event) => {
      validateValue();
    });
  }

  function bindInputDueDate() {
    dueDateReference.addEventListener("focusout", (event) => {
      validateDueDate();
    });
  }

  function bindInputMethod() {
    methodReference.addEventListener("focusout", (event) => {
      validateMethod();
    });
  }

  function bindSelectPayer() {
    payerReference.addEventListener("focusout", (event) => {
      validatePayer();
    });
  }

  function validateValue() {
    let inputValue = valueReference.value;
    if (inputValue < minValue) {
      setErrorFor(
        valueReference,
        "Valor minimo para geração de cobrança de R$ 5,00"
      );
      return;
    }
    if (!inputValue) {
      setErrorFor(valueReference, "Favor informar o valor.");
      return;
    }
    if (inputValue < zeroValue) {
      setErrorFor(valueReference, "Valor não aceito, favor verificar.");
      return;
    }
    setSucessFor(valueReference);
  }

  function validateDueDate() {
    var dueDateValue = dueDateReference.value;
    if (!dueDateValue) {
      setErrorFor(dueDateReference, "Favor informar a data de vencimento");
      return;
    }
    dueDateValue = dueDateValue.replace(/\//g, "-");
    var dueDateArray = dueDateValue.split("-");
    var day = dueDateArray[2];
    var month = dueDateArray[1];
    var year = dueDateArray[0];

    if (dueDateArray[0].length != 4) {
      day = dueDateArray[0];
      month = dueDateArray[1];
      year = dueDateArray[2];
    }

    var d1 = todayDate.getDate();
    var m1 = todayDate.getMonth() + 1;
    var y1 = todayDate.getFullYear();

    var d1 = new Date(y1, m1, d1);
    var d2 = new Date(year, month, day);

    var diff = d2.getTime() - d1.getTime();
    diff = diff / (1000 * 60 * 60 * 24);

    if (diff < zeroValue) {
      setErrorFor(
        dueDateReference,
        "Data não pode ser anterior ao dia de hoje"
      );
      return;
    }
    setSucessFor(dueDateReference);
  }

  function validateMethod() {
    let methodValue = methodReference.value;
    if (!methodValue) {
      setErrorFor(methodReference, "Escolha o método de pagamento.");
      return;
    }
    setSucessFor(methodReference);
  }

  function validatePayer() {
    let payerValue = payerReference.value;
    if (!payerValue) {
      setErrorFor(payerReference, "Escolha o pagador desta cobrança.");
      return;
    }
    setSucessFor(payerReference);
  }

  function validateRequiredsInputs() {
    validateMethod();
    validateDueDate();
    validatePayer();
    validateValue();
    validateForm();
  }

  function validateForm() {
    var formControls = formReference.querySelectorAll(".form-controller");
    var formIsValid = [...formControls].every((formControl) => {
      return formControl.className === "form-controller success";
    });
    if (formIsValid !== true) return alert("Favor verificar os campos.");
    bindPostFormSubmit();
  }

  function bindPostFormSubmit() {
    var formReference = $("form");
    var url = formReference.data("url");
    var params = formReference.serialize();

    $.post(url, params, function (response) {
      if (!response.success) {
        alert("Erro ao tentar gerar cobrança");
        return;
      }
      window.location.href = formReference.data("redirect");
    });
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
}

var paymentFormValidateController;

$(document).ready(function () {
  paymentFormValidateController = new PaymentFormValidateController();
  paymentFormValidateController.init();
});
