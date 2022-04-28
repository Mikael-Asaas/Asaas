$(document).ready(function () {
    $("form").on("submit", function(e) {
      e.preventDefault();
  
      var data = new FormData(document.querySelector("form"));
      var customer = {};
  
      data.forEach(function(value, key) {
        customer[key] = value;
      });
  
      var url = $('form').prop('action')
    
      $.post(url, customer, function(response) {
         if (response.success) {
         window.location.href = $('form').data('url-redirect');
        }
      });
    });

    document.getElementById("cep").addEventListener("input", function() {
      ClearForm();
      if (cepValido(this.value)) {
        pesquisarCep(this.value, preencherForm)
      }
    });

    function preencherForm(location) {
      document.getElementById("address").value = location.logradouro;
      document.getElementById("district").value = location.bairro;
      document.getElementById("city").value = location.localidade;
      document.getElementById("state").value = location.uf;
    };
    
    function ClearForm() {
      document.getElementById("address").value = "";
      document.getElementById("district").value = "";
      document.getElementById("city").value = "";
      document.getElementById("state").value = "";
      document.getElementById("number").value = "";
    };
  });