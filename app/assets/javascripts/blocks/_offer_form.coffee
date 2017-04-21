class MyCompleterAssist extends GmapsCompleterDefaultAssist
  positionOutputter: (latLng) ->
    $('@gmaps_output_latitude').val latLng.lat()
    $('@gmaps_output_longitude').val latLng.lng()

evil.block '@@offer_form',
  init: ->
    @country = @block.data('country')
    @region = @block.data('region')
    @init_address_search()

  init_address_search: ->
    completer = new GmapsCompleter
      mapElem: @gmaps_canvas
      inputField: @gmaps_input_address
      errorField: @gmaps_error
      zoomLevel: 4
      mapType: 'roadmap'
      pos: [-25.274398, 133.775136]
      debugOn: false
      assist: MyCompleterAssist

    completer.autoCompleteInit
      region: @region
      country: @country
      autocomplete:
        minLength: 4
        position:
          my: "center top"
          at: "center bottom"

  'click on @property_type_checkbox': (e) ->
    $('@property_type_checkbox:checked').not(e.target).removeAttr("checked")
    @property_type.val($(e.target).val())

  'click on @period_checkbox': (e) ->
    $('@period_checkbox:checked').not(e.target).removeAttr("checked")
    period_types = ['Week', 'Month', 'Year']

    if $.inArray( $(e.target).val(), period_types ) isnt -1
      @quantity_field.removeClass('invisible')
      @quantity_input.focus()
      @set_choosen_period()
    else
      @quantity_field.addClass('invisible')
      @period_input.val($('@period_checkbox:checked').val())

  'keyup keydown change paste blur on @quantity_input': ->
    @set_choosen_period()

  set_choosen_period: ->
    quantity = @quantity_input.val()
    period = $('@period_checkbox:checked').val()

    @period_input.val(quantity + ' ' + period)
