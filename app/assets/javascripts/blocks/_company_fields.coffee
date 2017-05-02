evil.block '@@company_fields',
  init: ->
  'click on @abn_confirm': ->
    if @abn_confirm.is(':checked')
      @company_fields.removeClass('invisible')
    else
      @company_fields.addClass('invisible')
