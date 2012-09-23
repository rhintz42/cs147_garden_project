// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
jQuery(document).ready(function(){

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
        	//$('#calendar_view_by_group').show();
        } else if (index == 2) {
					$('#calendar_view_by_plant').css("display","block");
					$('#calendar_view_by_group').css("display","none");
        	//$('#calendar_view_by_group').show();
        }
        //$('input[id=is_houseplant]').val(houseplantOptions[index]);
      });
    }
  });


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

	function populatePlants() {
	  for (pos in personal_plants) {
	  	var personal_plant = personal_plants[pos];
	  	var plants_2 = plants;
	  	var plant_id = personal_plant["plant_id"];
	  	var b = plants[personal_plant['plant_id']];
	  	var c = b['name_botanical'];
	  	$("#calendar_view_by_plant ol").append('<li class="ui-widget-content"><div></div><label>'+ personal_plant['name_personalized'] + ' - ' + plants[personal_plant['plant_id']]['name_common'] + '</label><input type="hidden" value="' + personal_plant["id"] + '" name="bookmark[]" /></li>');
	  }
	}
	
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