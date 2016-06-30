'use strict';

$(document).ready(function(){

  if($('#errors').text()=== "errors") {
      $('#error_message_overlay, #overlay_back').fadeIn(500)
  }

  $('#spaces_link').hover(function(){
    $('#spaces_highlight').attr('class','hoverHighlight')
  })

  $('#spaces_link').mouseleave(function(){
    $('#spaces_highlight').attr('class','hoverHighlightHidden')
  })

  $('#signup_link').on('click', function () {
    event.preventDefault()
    $('#signup_overlay, #overlay_back').fadeIn(500)
  })

  $('#login_link').on('click', function () {
    event.preventDefault()
    $('#login_overlay, #overlay_back').fadeIn(500)
  })

  $('#overlay_back').on('click', function () {
    event.preventDefault()
    $('#error_message_overlay, #login_overlay, #signup_overlay, #overlay_back').fadeOut(500)
  })


})
