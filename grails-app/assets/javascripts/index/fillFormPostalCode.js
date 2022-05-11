$(document).ready(function() {
  document.getElementById("postalCode").addEventListener("input", function() {
    clearForm();
    if (validationPostalCode && replacePostalCode(this.value)) {
      searchPostalCode(this.value, fillOutForm);
    }
  });

  function fillOutForm(location) {
    document.getElementById("address").value = location.logradouro;
    document.getElementById("province").value = location.bairro;
    document.getElementById("state").value = location.uf;
  }

  function clearForm() {
    document.getElementById("address").value = "";
    document.getElementById("province").value = "";
    document.getElementById("state").value = "";
    document.getElementById("addressNumber").value = "";
  }
});
