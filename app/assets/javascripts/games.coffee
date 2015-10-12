# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ajax:success', 'a.pointo', (status,data,xhr)->
  # the `data` parameter is the decoded JSON object
  $(".points-count[data-id=#{data.id}]").append('p').text data.points
  return