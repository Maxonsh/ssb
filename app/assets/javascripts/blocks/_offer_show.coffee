evil.block '@@offer_show',
  init: ->
    @init_event_handlers()

  init_event_handlers: ->
    @contact_modal.on('hidden.bs.modal', => @clear_modal())

  'click on @send_message': ->
    message = @contact_message.val()
    approved_financing = @approved_financing.prop('checked')
    email = @contact_email.val()
    sender_id = @sender_id.val()

    return if @validate_message(message)

    data = contact_message: { message: message, approved_financing: approved_financing, email: email, sender_id: sender_id }

    if (url = @contact_modal.data('url')).length > 0
      $.ajax(
        type: 'script'
        method: 'POST'
        url: url
        data: data
      )

    @contact_modal.modal('hide')

  clear_modal: ->
    @contact_message.val('')
    @approved_financing.prop('checked', false)

  validate_message: (message) ->
    if message is ''
      @contact_message.addClass('field-with-errors')
      true
