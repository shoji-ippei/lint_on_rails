# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#request_ajax_update').on 'ajax:complete', (event) ->
    if res = event.detail
      return $('#checked_wrap').html(event.detail[0].response)
    return
  return
