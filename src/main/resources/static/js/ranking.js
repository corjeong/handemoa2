$(document).ready(function () {
    alert("3");

    $(".categori_name").click(function (e) {
        $(this).siblings().css("background-color", "rgb(214, 214, 214)");
        $(this).siblings().children().css("color", "black");
        $(this).css("background-color", "#12379e");
        $(this).children().css("color", "#ffffff");
        
    });
});