class MyCompleterAssist extends GmapsCompleterDefaultAssist
  positionOutputter: (latLng) ->
    $('@gmaps-output-latitude').val latLng.lat()
    $('@gmaps-output-longitude').val latLng.lng()

evil.block '@@offer_form',
  'change on @country_select': ->
    country = @country_select.val()

    if this["init_#{country.toLowerCase().replace(/ /g,"_")}_address_search"]?
      this["init_#{country.toLowerCase().replace(/ /g,"_")}_address_search"]()
    else
      @gmap_group.addClass('hidden')

  init_australia_address_search: ->
    @gmap_group.removeClass('hidden')

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
      region: 'AU'
      country: 'Australia'
      autocomplete:
        minLength: 4
        position:
          my: "center top"
          at: "center bottom"

  init_new_zealand_address_search: ->
    @gmap_group.removeClass('hidden')

    completer = new GmapsCompleter
      mapElem: @gmaps_canvas
      inputField: @gmaps_input_address
      errorField: @gmaps_error
      zoomLevel: 5
      mapType: 'roadmap'
      pos: [-42.1346221, 172.901246]
      debugOn: false
      assist: MyCompleterAssist

    completer.autoCompleteInit
      region: 'NZ'
      country: 'New Zealand'
      autocomplete:
        minLength: 4
        position:
          my: "center top"
          at: "center bottom"
