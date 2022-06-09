function ValueMask() {

    var valueInputReference = $("#value");

    this.init = function() {
        valueInputReference.maskMoney({prefix:'R$ ', allowNegative: false, thousands:',', decimal:'.', affixesStay: false});
    };
}

var valueMask;

$(document).ready(function () {
    valueMask = new ValueMask();
    valueMask.init();
});
