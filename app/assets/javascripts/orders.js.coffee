# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('.icon-plus-sign').click ->
    $(this).closest('.landing').find('.order_details').slideToggle()