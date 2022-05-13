$(document).ready(function() {
    $("form").on("submit", function(event) {
      event.preventDefault();

      var url = $('form').prop('action')
    
      $.post(url, customer, function(response) {
         if (response.success) {
         window.location.href = $('form').data('url-redirect');
        }
      });
    });

    document.getElementById("postalCode").addEventListener("input", function() {
      clearForm();
      if (validationPostalCode(this.value)) {
         searchPostalCode(this.value, fillOutForm)
      }
    });

    function fillOutForm(location) {
      document.getElementById("address").value = location.logradouro;
      document.getElementById("province").value = location.bairro;
      document.getElementById("city").value = location.localidade;
      document.getElementById("state").value = location.uf;
    };
    
    function clearForm() {
      document.getElementById("address").value = "";
      document.getElementById("province").value = "";
      document.getElementById("city").value = "";
      document.getElementById("state").value = "";
      document.getElementById("addressNumber").value = "";
    };
  });