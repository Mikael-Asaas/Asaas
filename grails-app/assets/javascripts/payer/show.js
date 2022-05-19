$(document).ready(function () {
  let inputList = $("input");

  $(".js-edit").on("click", function (e) {
    e.preventDefault();
    $(this).hide();
    $(".js-send-button").removeClass("hide");

    inputList.each(function (index, input) {
      $(input).removeAttr("readonly");
    });
  });
});
