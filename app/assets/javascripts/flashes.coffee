$(document).ready ->
  $(window).bind 'rails:flash', (e, params) ->
    new PNotify(
      title: params.type
      text: params.message
      type: params.type)
