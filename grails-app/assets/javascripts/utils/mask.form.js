var cpfCnpjReference = $("#cpfCnpj");
var postalCodeReference = $("#postalCode");
var phoneReference = $("#phone");

new Inputmask({mask: ["(99) 9999-9999", "(99) 9 9999-9999"], showMaskOnHover: false, keepStatic: true}).mask(phoneReference);
new Inputmask({mask: ["999.999.999-99", "99.999.999/9999-99"], showMaskOnHover: false, keepStatic: true}).mask(cpfCnpjReference);
new Inputmask({mask: "99999-999", showMaskOnHover: false, keepStatic: true}).mask(postalCodeReference);