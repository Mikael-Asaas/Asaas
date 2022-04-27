$(document).ready(function(){
    
    var listaInput = $("input");

    $(".js-edit").on("click", function(e){
        e.preventDefault();
        $(this).addClass("hide")
        $(".js-send-button").removeClass("hide")

        listaInput.each(function(index, input){
            $(input).removeAttr("readonly")
        });
    });
});
    