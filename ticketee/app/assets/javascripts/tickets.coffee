# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#add_file").on "ajax:before", (event) ->
    $(event.target).data "params", { index: $('#assets div.file').length }

  $("#add_file").on "ajax:success", (event, data) ->
    $("#assets").append data