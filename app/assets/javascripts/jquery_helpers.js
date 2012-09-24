// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
jQuery(document).ready(function(){

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
          ajamminCall(result);
          /*
          params = "plants=" + JSON.stringify(result);
          $('#plant_watering').load('/calendar/index.html  #plant_watering', params);
          */
        }
      });

    function ajamminCall(result) {
          params = "plants=" + JSON.stringify(result);
          $('#plant_watering').load('/calendar/index.html  #plant_watering', params);
    }


    $( "#calendar_view_selectable" ).selectable({

      create: function(event, ui) {
      	populatePlants();
      },
      stop: function() {
        $( ".ui-selected", this ).each(function() {

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


});