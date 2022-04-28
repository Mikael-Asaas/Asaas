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
  });