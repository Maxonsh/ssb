evil.block '@@search',
  init: ->
    @country = @block.data('country')
    @region = @block.data('region')
    @init_address_search()
    @init_event_handlers()

  init_event_handlers: ->
    @property_dropdown.on('hidden.bs.dropdown', => @set_property_types())
    @property_parameters_dropdown.on('hidden.bs.dropdown', => @set_property_parameters())

  init_address_search: ->
    completer = new GmapsCompleter
      inputField: @address

    completer.autoCompleteInit
      region: @region
      country: @country
      autocomplete:
        minLength: 4
        position:
          my: 'center top'
          at: 'center bottom'

  set_property_parameters: ->
    return @additional_parameters.val('') if $('@additional_parameters_checkbox:checked').lenght is 0
    additional_parameters = $('@additional_parameters_checkbox:checked').map( -> $(this).val() ).get()
    @additional_parameters.val(additional_parameters)

  set_property_types: ->
    return @property_types.val('') if $('@property_type_checkbox:checked').lenght is 0
    search_properties = $('@property_type_checkbox:checked').map( -> $(this).val() ).get()
    @property_types.val(search_properties)

  'click on @all_property_types': ->
    @property_type_checkbox.prop('checked', false)
    @property_types.val('')

  'click on @property_type_checkbox': (e) ->
    @all_property_types.prop('checked', false)

  'click on @dropdown_menu': (e) ->
    e.stopPropagation()
