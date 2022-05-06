const validationPostalCode = function (postalCode) {
  return /^[0-9]{8}$/.test(postalCode);
};

const searchPostalCode = async (postalCode, callbackfunction) => {
  let url = `https://viacep.com.br/ws/${postalCode}/json/`;
    let dados = await fetch(url);
    let address = await dados.json();
    callbackfunction(address)
};
