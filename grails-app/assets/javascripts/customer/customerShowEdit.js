$(document).ready(function(){
    
    var listaInput = $("input");

    $(".js-edit").on("click", function(e){
        e.preventDefault();
        $(this).hide();
        $(".js-send-button").removeClass("hide")

        listaInput.each(function(index, input){
            $(input).removeAttr("readonly")
        });
    });
});