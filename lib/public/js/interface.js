'use strict';

$(document).ready(function(){

  if($('#errors').text()=== "errors") {
      $('#error_message_overlay, #overlay_back').fadeIn(500)
  }

  $('.layoutLinkBox').mouseover(function(){
    $('#'+this.id+'_hl').attr('class','hoverHighlight')
  })

  $('.layoutLinkBox').mouseleave(function(){
    $('#'+this.id+'_hl').attr('class','hoverHighlightHidden')
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
