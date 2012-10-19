# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $("#loginform").dialog
    title: "An Holarse anmelden",
    width: 450,    
    height: 350,
    modal: true,
    autoOpen: false

$ ->
  $("#loginform-link").click (event) ->
    event.preventDefault()
    event.stopPropagation()
    $("#loginform").dialog('open')

  
