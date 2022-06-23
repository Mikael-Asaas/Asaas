$(document).ready(function () {
    var log = document.getElementById("login");
  
    log.addEventListener("DOMContentLoaded", passwordDisplayToggle, function () {
      document.forms["loginForm"].elements["username"].focus();
    });
  
    function passwordDisplayToggle() {
      var toggleEl = document.getElementById("passwordToggler");
      var eyeIcon = "\u{1F441}";
      var xIcon = "\u{2715}";
      var passEl = document.getElementById("password");
      if (passEl.type === "password") {
        toggleEl.innerHTML = xIcon;
        passEl.type = "text";
      } else {
        toggleEl.innerHTML = eyeIcon;
        passEl.type = "password";
      }
    }
  });