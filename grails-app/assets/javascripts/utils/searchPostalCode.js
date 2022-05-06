const validationPostalCode = function (postalCode) {
  return /^[0-9]{8}$/.test(postalCode);
};
const verificationPostalCode = function (postalCode) {
  return postalCode.replace(/\D/g, "");
};
const searchPostalCode = async (postalCode, callbackfunction) => {
  if (verificationPostalCode(postalCode).length == 8) {
    let url = `https://viacep.com.br/ws/${postalCode}/json/`;
    let dados = await fetch(url);
    let address = await dados.json();
    callbackfunction(address);
  }
};
