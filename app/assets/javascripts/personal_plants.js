jQuery(document).ready(function(){

  var $tabs = $('#tabs').tabs();
    
  $(".ui-tabs-panel").each(function(i){
 
    var totalSize = $(".ui-tabs-panel").size() - 1;
 
    if (i != totalSize) {
      next = i + 2;
      $(this).append("<a href='#' class='next-tab mover' rel='" + next + "'>Next Page &#187;</a>");
    }
 
    if (i != 0) {
      prev = i;
      $(this).append("<a href='#' class='prev-tab mover' rel='" + prev + "'>&#171; Prev Page</a>");
    }
 
  });

  //
  var v = $("#water_frequency").val();
  if ($("#water_frequency").val()) {
    v = $("#water_frequency").val();
  } else {
    v = 2.5;
  }
   $( "#slider" ).slider({
     value:v,
     min: 0,
     max: 7,
     step: .5,
     slide: function( event, ui ) {
       $( "#water_frequency" ).val( ui.value );
       var result = $( "#select-result" ).empty();
       result.append(ui.value);
     }
   });
  var result = $( "#select-result" ).empty();
  result.append($("#slider").slider("value"));


  $("#water_frequency").val($("#slider").slider("value"));

  $("#watering_last").datepicker({dateFormat: 'yy-mm-dd'});


  $( "#plant_selectables" ).selectable({

      create: function(event, ui) {
        doCreateStuff();
        //$('#new-plant-fields').css("display","none");
        //$('#old-plant-fields').css("display","none");
      },
      
      stop: function() {
        var result = [];
        $( ".ui-selected", this ).each(function() {
          $('#old-plant-fields').css("display","block");
          var index = $( "#plant_selectable li" ).index( this );
          
          var d = $(this).children('input').attr("value");
          result.push(parseInt(d));
        });
        params = "plants=" + JSON.stringify(result);
        $('#old-plant-fields').load('/personal_plants/new  #old-plant-fields', params);
      }

    });


  $( "#calendar_view_selectables" ).selectable({

    create: function(event, ui) {
      populatePlant();
    },
    stop: function() {
      $( ".ui-selected", this ).each(function() {

        var index = $( "#calendar_view_selectables li" ).index( this );

        if (index == 0) {
          $('#calendar_view_by_plants').css("display","none");
          $('#calendar_view_by_groups').css("display","block");
        } else if (index == 1) {
          $('#calendar_view_by_plants').css("display","block");
          $('#calendar_view_by_groups').css("display","none");
        }
      });
    }
  });
  
  function doCreateStuff() {
    $('#new-plant-fields').css("display","none");
    $('#old-plant-fields').css("display","none");
  }

  function populatePlant() {
    for (pos in plants) {
      var plant = plants[pos];
      var plant_id = plant["id"];
      var d = '<li class="ui-widget-content"><div></div><label>'+ plant['name_common'] + ' - ' + plant['name_botanical'] + '</label><input type="hidden" value="' + plant_id + '" name="bookmark[]" /></li>';
      $("#calendar_view_by_plants ol").append(d);
    }
  }


 
  // $('.next-tab, .prev-tab').click(function() { 
  //   $tabs.tabs('select', $(this).attr("rel"));
  //   return false;
  // });

  // $("#tabs").tabs('select',0);
  // //$("#tabs").tabs({disabled: [2]});
  
  // if ( typeof $( "#actual_sun_exposure" )[0].attributes.value != 'undefined') {
  //   var value = $( "#actual_sun_exposure" )[0].attributes.value.value;
  //   if (value == "0") {
  //     var b = $( "#actual_sun_exposure_0").addClass("ui-selected");
  //   } else if (value == "1") {
  //     var b = $( "#actual_sun_exposure_1").addClass("ui-selected");
  //   } else if (value == "2") {
  //     var b = $( "#actual_sun_exposure_2").addClass("ui-selected");
  //   }
  // }

  // //*************************************************
  // //Setting a form value from jQuery
  // //$('input[id=is_houseplant]').val(houseplantOptions[index]);
  // $( "#actual_sun_exposure_selectable" ).selectable({
  //   stop: function() {
  //     $( ".ui-selected", this ).each(function() {
  //       var index = $( "#actual_sun_exposure_selectable li" ).index( this );
  //       $('input[id=actual_sun_exposure]').val(index);
  //     });
  //   }
  // });

  // $( "#effectTypes" ).change(function() {
  //    runEffect();
  //    return false;
  // });

  // $( "#button" ).click(function() { 
  //   runEffect(); 
  //   return false; 
  // });

  /* 
  $("#watering_next").datepicker({dateFormat: 'yy-mm-dd'});
  */
  /*
  $.fn.togglepanels = function(){
    return this.each(function(){
      $(this).addClass("ui-accordion ui-accordion-icons ui-widget ui-helper-reset")
        .find("h3")
        .addClass("ui-accordion-header ui-helper-reset ui-state-default ui-corner-top ui-corner-bottom")
        .hover(function() { $(this).toggleClass("ui-state-hover"); })
        .prepend('<span class="ui-icon ui-icon-triangle-1-e"></span>')
        .click(function() {
          $(this)
            .toggleClass("ui-accordion-header-active ui-state-active ui-state-default ui-corner-bottom")
            .find("> .ui-icon").toggleClass("ui-icon-triangle-1-e ui-icon-triangle-1-s").end()
            .next().slideToggle();
          return false;
        })
        .next()
          .addClass("ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom")
          .hide();
    });
  };
  $("#notaccordion").togglepanels();
  */

  /*
  function runEffect() {
    // get effect type from
    var selectedEffect = $( "#effectTypes" ).val();

    // most effect types need no options passed by default
    var options = {};
  
    // some effects have required parameters
    if ( selectedEffect === "scale" ) {
      options = { percent: 100 };
    } else if ( selectedEffect === "size" ) {
      options = { to: { width: 280, height: 185 } };
    }
  
    // run the effect
    $( "#effect" ).show( selectedEffect, options, 500, callback );
  };
 
  function callback() {
    //setTimeout(function() {
    //  $( "#effect:visible" ).removeAttr( "style" ).fadeOut();
    //}, 1000 );
  };

  //$(function() {
  //  $( "#effect" ).hide();
  //});
  */

});
