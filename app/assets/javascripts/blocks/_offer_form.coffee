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
