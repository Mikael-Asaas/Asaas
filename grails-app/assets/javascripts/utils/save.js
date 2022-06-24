$(document).ready(function () {
  $("form").on("submit", function (event) {

    event.preventDefault();
    
    var formReference = $("form");
    var url = formReference.data("url");
    var params = formReference.serialize();

    $.post(url, params, function (response) {
      if (!response.success) {
        alert(`Um problema inesperado ocorreu. Aguarde alguns minutos e tente novamente. Caso o problema persista, entre em contato com os administradores do sistema.`);
        return;
      }
      window.location.href = formReference.data("redirect");
    });
  });
});
