// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
jQuery(document).ready(function(){

  /*
    There was a issue when this was at the bottom.
    The issue seemed that this wasn't being loaded fast enough.
    Fixed it by putting it at the top
  */
  /*
  $( "#plant_selectable" ).selectable({

      selecting: function(e, ui) {
        if($(ui.selecting).hasClass('ui-selected')) {
          $(ui.selecting).removeClass('ui-selected');
          $(ui.selecting).removeClass('ui-selectee');
          $(ui.selecting).removeClass('ui-select');
          $(ui.selecting).removeClass('ui-selecting');
        }
      },
      unselecting: function(e, ui) {
        $(ui.unselecting).addClass('ui-selected');   
      },

      stop: function() {
        var result = [];
        $( ".ui-selected", this ).each(function() {
          var index = $( "#plant_selectable li" ).index( this );
          
          var d = $(this).children('input').attr("value");
          result.push(parseInt(d));
        });
        params = "plants=" + JSON.stringify(result);
        $('#plant_watering').load('/calendar/index.html  #plant_watering', params);
      }

    });


  $( "#calendar_view_selectable" ).selectable({

    create: function(event, ui) {
    	populatePlants();
    },
    stop: function() {
      $( ".ui-selected", this ).each(function() {
        var houseplantOptions = new Array();
        houseplantOptions[0] = 'true';
        houseplantOptions[1] = 'false';

        var index = $( "#calendar_view_selectable li" ).index( this );

        if (index == 0) {
        	$('#calendar_view_by_plant').css("display","none");
					$('#calendar_view_by_group').css("display","none");
        } else if (index == 1) {
        	$('#calendar_view_by_plant').css("display","none");
					$('#calendar_view_by_group').css("display","block");
        } else if (index == 2) {
					$('#calendar_view_by_plant').css("display","block");
					$('#calendar_view_by_group').css("display","none");
        }
      });
    }
  });


	function populatePlants() {
	  for (pos in plants) {
      var plant = plants[pos];
	  	var plant_id = plant["id"];
      var b = plant['name_common'];
	  	var c = plant['name_botanical'];
      var d = '<li class="ui-widget-content"><div></div><label>'+ plant['name_common'] + ' - ' + plant['name_botanical'] + '</label><input type="hidden" value="' + plant["id"] + '" name="bookmark[]" /></li>';
	  	$("#calendar_view_by_plant ol").append(d);
	  }
	}
	*/
  //$("#calendar_view_by_plant ol").append('<li class="ui-widget-content">' + personal_plants[1]['id'] + '</li>');
  //$("#calendar_view_by_plant ol").append('<li class="ui-widget-content">Item 7</li>');
  

//$('#result').load('/calendar/index.html  #plant_watering', '{ cool: "hello" }', function() {

/*
	$.ajax({
	  url: "index.html",
	  context: document.body,
	  success: function(s,x){
	    $(this).html(s);
	  }
	});
*/
//var a = new Object();
//a = [1, 2, 5, 4];




  //$("#plant_selectable ol").listview('refresh')
  //$("<li/>").appendTo("#plant_selectable ol").html("Fields marked with * are required.");​
  //$('#calendar_view_by_plant ol').append($('<li/>', {    //here appendin `<li>`
  //  'data-role': "list-divider",
  //  'class': "ui-widget-content",
  //  'text': 'hello'
	//}));
	//$('ol').listview('refresh');



});