function FormValidationsController() {
    this.init = function () {
      bindSubmitForm();
      bindInputName();
      bindInputCpfCnpj();
      bindInputPostalCode();
      bindInputEmail();
      bindInputPhone(); 
      bindInputAddressNumber();
      bindInputAddress();
      bindInputProvince();
      bindInputState()
      bindInputCity();
    };
  
    var formReference = document.querySelector("form");
    var nameReference = document.getElementById("name");
    var cpfCnpjReference = document.getElementById("cpfCnpj");
    var postalCodeReference = document.getElementById("postalCode");
    var emailReference = document.getElementById("email");
    var addressReference = document.getElementById("address");
    var provinceReference = document.getElementById("province");
    var cityReference = document.getElementById("city");
    var stateReference = document.getElementById("state");
    var phoneReference = document.getElementById("phone");
    var addressNumberReference = document.getElementById("addressNumber")
    var correctPostalCodeLength = 9;
    var correctCpfLength = 13;
    var correctCnpjLength = 17;
  
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

    function validateAddress() {
      let  = addressValue = addressReference.value;
      if (!addressValue) {
        setErrorFor(addressReference, "O seu Endereço é obrigatório!");
        return;
      }
      setSucessFor(addressReference);
    }
    
    function validateProvince() {
      let  = provinceValue = provinceReference.value;
      if (!provinceValue) {
        setErrorFor(provinceReference, "O seu Bairro é obrigatório!");
        return;
      }
      setSucessFor(provinceReference);
    }

    function validateState() {
      let  = stateValue = stateReference.value;
      if (!stateValue) {
        setErrorFor(stateReference, "O seu Estado é obrigatório!");
        return;
      }
      setSucessFor(stateReference);
    }

    function validateCity() {
      let  = cityValue = cityReference.value;
      if (!cityValue) {
        setErrorFor(cityReference, "O seu Estado é obrigatório!");
        return;
      }
      setSucessFor(cityReference);
    }
  
    function validateCpf() {
      let cpfCnpjValue = cpfCnpj.value;
      if (!cpfCnpjValue) return setErrorFor(cpfCnpjReference, "Preencha seu CPF");
      if (cpfCnpjValue.length == correctCpfLength) {
        cpfCnpjValue == "00000000000" ||
          cpfCnpjValue == "11111111111" ||
          cpfCnpjValue == "22222222222" ||
          cpfCnpjValue == "33333333333" ||
          cpfCnpjValue == "44444444444" ||
          cpfCnpjValue == "55555555555" ||
          cpfCnpjValue == "66666666666" ||
          cpfCnpjValue == "77777777777" ||
          cpfCnpjValue == "88888888888" ||
          cpfCnpjValue == "99999999999";
        return setErrorFor(cpfCnpjReference, "O cpf informado é inválido");
      }
      setSucessFor(cpfCnpjReference);
    }
  
    function validateCnpj() {
      let cpfCnpjValue = cpfCnpj.value;
      if (!cpfCnpjValue) return setErrorFor(cpfCnpjReference, "Preencha seu CPF");
      if (
        cpfCnpjValue.length == correctCnpjLength ||
        cpfCnpjValue == "00000000000000" ||
        cpfCnpjValue == "11111111111111" ||
        cpfCnpjValue == "22222222222222" ||
        cpfCnpjValue == "33333333333333" ||
        cpfCnpjValue == "44444444444444" ||
        cpfCnpjValue == "55555555555555" ||
        cpfCnpjValue == "66666666666666" ||
        cpfCnpjValue == "77777777777777" ||
        cpfCnpjValue == "88888888888888" ||
        cpfCnpjValue == "99999999999999"
      ) {
        return setErrorFor(cpfCnpjReference, "O CNPJ informado é inválido");
      }
      setSucessFor(cpfCnpjReference);
    }

    function validateEmail() {
      let emailValue = emailReference.value;
      if (!emailValue) {
        setErrorFor(emailReference, "O email é obrigatório");
        return;
      }
      setSucessFor(emailReference);
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
      let cpfCnpjValue = cpfCnpj.value;
      validateName();
      if (cpfCnpjValue.length == correctCpfLength) {
        validateCpf();
      } else {
        validateCnpj();
      }
      validateCity();
      validateState();
      validateProvince();
      validateAddress();
      validatePhone();
      validateAddressNumber();
      validatePostal();
      validateEmail();
      validateFormIsValid();
    }
  
    function validateFormIsValid() {
      let formControls = formReference.querySelectorAll(".form-control");
      let formIsValid = [...formControls].every((formControl) => {
        return formControl.className === "form-control success";
      });
    }
  
    function fillAddress(data) {
      if (data.erro) {
        setErrorFor(postalCodeReference, "Não foi possível localizar o endereço");
        addressReference.value = "";
        provinceReference.value = "";
        stateReference.value = "";
        cityReference.value = "";
        document.querySelector("#address").value = "";
        document.querySelector("#province").value = "";
        document.querySelector("#city").value = "";
        document.querySelector("#state").value = "";
        return;
      }
      setSucessFor(postalCodeReference);
      setSucessFor(addressReference);
      setSucessFor(provinceReference);
      setSucessFor(stateReference);
      setSucessFor(cityReference);
      setSucessFor(complementReference);
      document.querySelector("#address").value = data.logradouro;
      document.querySelector("#province").value = data.bairro;
      document.querySelector("#city").value = data.localidade;
      document.querySelector("#state").value = data.uf;
    }
  
    function setSucessFor(input) {
      let formControl = input.parentElement;
  
      $(formControl).addClass("form-control success").removeClass("error");
    }
  
    function setErrorFor(input, message) {
      let formControl = input.parentElement;
      let smallDisplayError = formControl.querySelector(".js-msg");
  
      smallDisplayError.innerText = message;
      $(formControl).addClass("form-control error").removeClass("success");
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

    function bindInputAddress() {
      addressReference.addEventListener("focusout", (event) => {
        validateAddress();
      }); 
    }

    function bindInputProvince() {
      provinceReference.addEventListener("focusout", (event) => {
        validateProvince();
      }); 
    }

    function bindInputState() {
      stateReference.addEventListener("focusout", (event) => {
        validateState();
      }); 
    }
    
    function bindInputCity() {
      cityReference.addEventListener("focusout", (event) => {
        validateCity();
      }); 
    }
  
    function bindInputCpfCnpj() {
      cpfCnpjReference.addEventListener("focusout", (event) => {
        let cpfCnpjValue = cpfCnpj.value;
        if (cpfCnpjValue.length == correctCpfLength) {
          validateCpf();
          return;
        }
        validateCnpj();
      });
    }
  
    function bindInputPostalCode() {
      postalCodeReference.addEventListener("focusout", function () {
        validatePostal();
        if (validatePostalCode(this.value)) {
          getPostalCode(this.value, fillAddress);
        }
      });
    }
  
    function bindInputEmail() {
      emailReference.addEventListener("focusout", (event) => {
        validateEmail();
      });
    }
  }
  var formValidationsController;
  
  $(document).ready(function () {
    formValidationsController = new FormValidationsController();
    formValidationsController.init();
  });