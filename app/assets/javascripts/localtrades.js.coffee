# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# Activate selected gender
$("button[buy-sell=" + $('#hidden_field_id').val() + "]").addClass('active')

# Set buy/val value
$("#buy-toggle button").click -> 
  $('#hidden_field_id').val($(this).data('buy'))