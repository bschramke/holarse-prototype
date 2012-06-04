# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $("#twitterwall").tweet
    "avatar_size": 64,
    "count": 30,
    "fetch": 30,
    "username": "holarse",
    "list": "linuxgaming",    
    loading_text: "loading tweets...",
    refresh_interval: 30

