evil.block '@@company_fields',
  'click on @abn_confirm': ->
    if @abn_confirm.is(':checked')
      @company_fields.removeClass('hidden')
    else
      @company_fields.addClass('hidden')
