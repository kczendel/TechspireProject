$(document).ready(function () {
    $(".link_table tbody").each(function (index) {
    console.log(index)
    if(index != 0){
        $(this).css("visibility", "collapse")
    }

    })



    $(".collapse_button").click(function (){
        target = $(this).parent().parent().children("tbody")
        if (target.css("visibility") == "collapse"){
            target.css("visibility", "visible")
        }
        else{
            target.css("visibility", "collapse")
        }
    })
})
