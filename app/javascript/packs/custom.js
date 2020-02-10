window.togglepwdeye = function ()
{
    console.log("Clicked the eye!! Windowfn")

    if ($("#pwd").attr("type") == "text")
    { 
       $("#pwd").prop('type','password');
       $('.fa-eye-slash').toggleClass("fa-eye");
    }
    else
    { 
      $("#pwd").prop('type','text'); 
      $('.fa-eye').toggleClass("fa-eye-slash");
    }
}
