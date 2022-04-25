$(document).ready(function () {
  $("form").on("submit", function (e) {
    e.preventDefault();

    var data = new FormData(document.querySelector("form"));
    var payer = {};

    data.forEach(function (value, key) {
      payer[key] = value;
    });

    var redirect;

    if ($(this).find(".js-payer-id").val()) {
      redirect = "/payer/update";
    } else {
      redirect = "/payer/save";
    }

    $.post(redirect, payer, function (response) {
      console.log(response);
      if (response.success) {
        window.location.href = "/payer/index";
        return;
      }
    });
  });
});
