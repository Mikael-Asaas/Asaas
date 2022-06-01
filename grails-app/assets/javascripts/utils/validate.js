function validationController() {
    this.init = function() {
        listenerForm();
        listenerName();
        listenerCpfCnpj();
        listenerPostalCode();
        listenerEmail();
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
    
    function validateName() {
        let valueName = nameReference.value;
        if (!valueName == null) {
            setErrorFor(nameReference, "O seu nome é obrigatório!");
            return;
        }
        setSucessFor(nameReference);
    }
}

