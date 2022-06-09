function FormValidateController() {
    this.init = function() {
        bindSubmitForm();
        bindInputName();
        bindInputCpfCnpj();
        bindInputEmail();
        bindInputPhone();
        bindInputPostalCode();
        bindInputAddress();
        bindInputAddressNumber();
        bindInputProvince();
        bindInputCity();
        bindInputState();
        bindPostFormSubmit();
    }
    
    var formReference = document.querySelector("form");
    var nameReference = document.getElementById("name");
    var emailReference = document.getElementById("email");
    var cpfCnpjReference = document.getElementById("cpfCnpj");
    var phoneReference = document.getElementById("phone");
    var postalCodeReference = document.getElementById("postalCode");
    var addressReference = document.getElementById("address");
    var addressNumberReference = document.getElementById("addressNumber")
    var provinceReference = document.getElementById("province");
    var cityReference = document.getElementById("city");
    var stateReference = document.getElementById("state");
    var correctPostalCodeLength = 8;
    var correctCpfLength = 11;
    var correctCnpjLength = 14;
    
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
                validateCpfCnpj();
            })
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
    
      function bindInputPostalCode() {
        postalCodeReference.addEventListener("focusout", function () {
          validatePostal();
          if (validationPostalCode(this.value)) {
            searchPostalCode(this.value, fillOutForm());
          }
        });
      }

      function bindPostFormSubmit() {
          var formReference = $("form");
          var url = formReference.data("url");
          var params = formReference.serialize();
    
          $.post(url, params, function(response) {
              if (!response.success) {
                  alert("Verifique todos os campos.");
                  return;
              }
              window.location.href = formReference.data("redirect");
          });
      }
    
      function validateName() {
        let nameValue = nameReference.value;
        if (!nameValue) {
          setErrorFor(nameReference, "O seu nome é obrigatório!");
          return;
        }
        setSucessFor(nameReference);
      }

      function validateCpfCnpj() {
          let cpfCnpjValue = cpfCnpjReference.value;
          if (!cpfCnpjValue) {
              setErrorFor(cpfCnpjReference, "O campo CPF/CNPJ.")
              return;
          }
          setSucessFor(cpfCnpjReference);
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
          setErrorFor(cityReference, "A sua Cidade é obrigatório!");
          return;
        }
        setSucessFor(cityReference);
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
        validateName();
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
        let formControls = formReference.querySelectorAll(".form-controller");
        let formIsValid = [...formControls].every((formControl) => {
          return formControl.className.includes("success");
        });
        if (formIsValid != true) return alert("Favor verificar os campos.");
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
}

var formValidateController;

$(document).ready(function() {
    formValidateController = new FormValidateController();
    formValidateController.init();
});
