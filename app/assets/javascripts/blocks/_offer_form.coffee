class MyCompleterAssist extends GmapsCompleterDefaultAssist
  positionOutputter: (latLng) ->
    $('@gmaps_output_latitude').val latLng.lat()
    $('@gmaps_output_longitude').val latLng.lng()

evil.block '@@offer_form',
  init: ->
    @country = @block.data('country')
    @region = @block.data('region')
    @init_address_search()
    @init_daterange_picker()
    @init_events_handlers()

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

  init_daterange_picker: ->
    @daterange_input.daterangepicker()

  'click on @rent_confirm': (e) ->
    if $(e.target).is(':checked')
      @rent_fields.removeClass('invisible')
    else
      @rent_fields.addClass('invisible')

  'change on @period_select': (e) ->
    period_types = ['Week', 'Month', 'Year']

    if $.inArray( $(e.target).val(), period_types ) isnt -1
      @quantity_field.removeClass('invisible')
      @daterange_field.addClass('invisible')
      @quantity_input.focus()
      @set_choosen_period()
    else if $(e.target).val() is 'Daterange'
      @quantity_field.addClass('invisible')
      @daterange_field.removeClass('invisible')
      @period_input.val(@daterange_input.val())
    else if $(e.target).val() is 'Select rent period'
      @period_input.val(null)
    else
      @quantity_field.addClass('invisible')
      @daterange_field.addClass('invisible')
      @period_input.val(@period_select.val())

  'keyup keydown change paste blur on @quantity_input': ->
    @set_choosen_period()

  'change on @property_type_select': (e) ->
    @property_type_input.val($('@property_type_select option:selected').text())

    if $('@property_type_select option:selected').text() is 'Select property type'
      @property_type_input.val('')
      @floor_area.addClass('invisible')
      @land_area.addClass('invisible')

    if $(e.target).val() is 'F'
      @floor_area.removeClass('invisible')
      @land_area.addClass('invisible')
    else if $(e.target).val() is 'L'
      @floor_area.addClass('invisible')
      @land_area.removeClass('invisible')
    else if $(e.target).val() is 'LF'
      @floor_area.removeClass('invisible')
      @land_area.removeClass('invisible')

  init_events_handlers: ->
    @daterange_input.on(
      'apply.daterangepicker'
      (e, picker) =>
        @set_daterange()
    )

  set_daterange: ->
    daterange = @daterange_input.val()

    @period_input.val(daterange)

  set_choosen_period: ->
    quantity = @quantity_input.val()
    period = @period_select.val()

    @period_input.val(quantity + ' ' + period)
