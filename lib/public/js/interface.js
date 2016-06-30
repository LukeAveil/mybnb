'use strict';

$(document).ready(function(){

  $('#spaces_link').hover(function(){
    $('#spaces_highlight').attr('class','hoverHighlight');
  })

  $('#spaces_link').mouseleave(function(){
    $('#spaces_highlight').attr('class','hoverHighlightHidden');
  })


  function updateTemperature() {
    $('body').attr('class','c'+ thermostat.getCurrentTemperature());
    g.refresh(thermostat.getCurrentTemperature());
  }

  updateTemperature();
  thermostat.powerSaving ? $('#PSM_status').text('on') : $('#PSM_status').text('off');

  $('#increase').on('click', function(){
    thermostat.increaseTemperature();
    updateTemperature();
  })

  $('#decrease').on('click', function(){
    thermostat.decreaseTemperature();
    updateTemperature();
  })

  $('#reset').on('click', function(){
    thermostat.resetTemperature();
    updateTemperature();
    })

  $('#psm_button').on('click', function(){
    if($('#psm_button').text() === 'on')  {
      thermostat.disablePowerSavingMode();
      $('#psm_button').text('off');
      $('#psm_button').attr('class', 'psm_button_2');
      $('#gauge').attr('class', 'gauge_psm_off');
    }
    else {
      thermostat.enablePowerSavingMode();
      $('#psm_button').text('on');
      $('#psm_button').attr('class', 'psm_button_1');
      $('#gauge').attr('class', 'gauge_psm_on');
      updateTemperature();
    }
  })

});
