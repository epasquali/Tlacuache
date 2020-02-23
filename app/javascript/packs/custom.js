/*Populates states based on selected country in address/location forms*/

/*Commenting out for now until we expand outside GDL. Uncomment when
want to add state and country dropdowns to listings form

$(document).ready(function () { 
  populateregions();
})


function populateregions()
{
  var country = $('#listing_country option:selected').text();

  const node = document.getElementById('countrydata')
  const countrydata = JSON.parse(node.getAttribute('data'))

  //var countrydata = '#{j GENERALCFG['countrydata'].to_json.html_safe}';
  //countrydata = JSON.parse(countrydata);
  
  var r = countrydata.find((x)=>{return x['name'] == country})
  var regions = r['regions']
  
  $('#listing_state').empty();
  
  for (var i in regions)
  {   
    $('#listing_state').append(new Option(regions[i], regions[i]));
  }

  //Default an arbitrary selected value, because for some reason some
  //users are not saving a selection here.
  $('#listing_state').prop("selectedIndex", 0);

  $('#listing_state').trigger('change');
  
}

*/

/*Toggles the password field show/hide eye icon*/
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


