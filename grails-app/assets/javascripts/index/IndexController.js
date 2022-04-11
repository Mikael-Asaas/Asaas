const formReference = document.getElementById("formid");

formReference.addEventListener("submit", (event) => {
  event.preventDefault();

  var customer = {};
  var form = document.querySelector("form");
  var data = new FormData(form);
  data.forEach(function (value, key) {
    customer[key] = value;
  });

  console.log(customer);
  alert("Formulario Enviado!");
  formReference.reset();
});