# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#project_starts_at').datepicker({firstDay: 1});
  $('#project_ends_at').datepicker({firstDay: 1});
  $('#myTab').tabs;
  $('#todos').sortable(
      axis: 'y'
      handle: '.badge'
      update: ->
        $.post($(this).data('update-url'), $(this).sortable('serialize'))
    );
$( "#tabsy" ).tabs();


