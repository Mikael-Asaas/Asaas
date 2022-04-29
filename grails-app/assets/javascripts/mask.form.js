var inputCpfCnpj = $("#cpfcnpj")[0];
var inputCep = $("#cep")[0];
var inputTelephone = $("#telephone")[0];

new Inputmask({mask: ["(99) 9999-9999", "(99) 9 9999-9999"], showMaskOnHover: false, keepStatic: true}).mask(inputTelephone);
new Inputmask({mask: ["999.999.999-99", "99.999.999/9999-99"], showMaskOnHover: false, keepStatic: true}).mask(inputCpfCnpj);
new Inputmask({mask: "99999-999", showMaskOnHover: false, keepStatic: true}).mask(inputCep);


