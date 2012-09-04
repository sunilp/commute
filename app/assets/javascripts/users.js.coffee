# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
	$('#messaging_to_name').autocomplete
		source: "/allusers"
		select:(event,ui) ->
			$('#messaging_to_id').val(ui.item.id)