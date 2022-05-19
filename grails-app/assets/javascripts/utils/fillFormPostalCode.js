$(document).ready(function() {
  document.getElementById("postalCode").addEventListener("input", function () {
    if (validationPostalCode && replacePostalCode(this.value)) {
      searchPostalCode(this.value, fillOutForm);
    }
  });

function fillOutForm(location) {
  document.getElementById("address").value = location.logradouro;
  document.getElementById("province").value = location.bairro;
  document.getElementById("city").value = location.localidade;
  document.getElementById("state").value = location.uf;
};
});
