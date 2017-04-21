evil.block '@@company_fields',
  init: ->
    console.log 'dfdfdfdf', @abn_confirm, @company_fields
  'click on @abn_confirm': ->
    if @abn_confirm.is(':checked')
      @company_fields.removeClass('invisible')
    else
      @company_fields.addClass('invisible')
