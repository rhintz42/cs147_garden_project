// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
jQuery(document).ready(function(){

  $( "#calendar_view_selectable" ).selectable({
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
			stop: function() {
				var result = $( "#select-result" ).empty();
				$( ".ui-selected", this ).each(function() {
					var index = $( "#plant_selectable li" ).index( this );
					result.append( " #" + ( index + 1 ) );
				});
			}
		});

  $("#calendar_view_by_plant ol").append('<li class="ui-widget-content">Item 7</li>');
  $("#calendar_view_by_plant ol").append('<li class="ui-widget-content">Item 7</li>');
  








  //$("#plant_selectable ol").listview('refresh')
  //$("<li/>").appendTo("#plant_selectable ol").html("Fields marked with * are required.");​
  //$('#calendar_view_by_plant ol').append($('<li/>', {    //here appendin `<li>`
  //  'data-role': "list-divider",
  //  'class': "ui-widget-content",
  //  'text': 'hello'
	//}));
	//$('ol').listview('refresh');



});