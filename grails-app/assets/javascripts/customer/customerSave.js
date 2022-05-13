$(document).ready(function() {
  $("form").on("submit", function(event) {
    
    event.preventDefault();

    var formReference = $("form");
    var url = formReference.data("url");
    var params = formReference.serialize();

    $.post(url, params, function(response) {
      if(response.success) {
        window.location.href = formReference.data("redirect");
      }
    })
  })
})