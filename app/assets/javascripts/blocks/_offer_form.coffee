class MyCompleterAssist extends GmapsCompleterDefaultAssist
  positionOutputter: (latLng) ->
    $('#gmaps-output-latitude').val latLng.lat()
    $('#gmaps-output-longitude').val latLng.lng()

evil.block '@@offer_form',
  init: ->
    console.log 'INIT!!!'


  'change on @country_select': (e) ->
    country = $(e.target).val()

    if country == 'New Zealand'
      @init_new_zealand_map()
    else if country == 'Australia'
      @init_australia_map()
    else
      @gmap_group.addClass('hidden')

  init_australia_map: ->
    @gmap_group.removeClass('hidden')

    completer = new GmapsCompleter
      mapElem: '#gmaps-canvas',
      inputField: '#gmaps-input-address',
      errorField: '#gmaps-error',
      zoomLevel: 4,
      mapType: 'roadmap',
      pos: [-25.274398, 133.775136],
      debugOn: false
      assist: MyCompleterAssist

    completer.autoCompleteInit
      region: 'AU',
      country: 'Australia',
      autocomplete:
        minLength: 4,
        position:
          my: "center top",
          at: "center bottom"

  init_new_zealand_map: ->
    @gmap_group.removeClass('hidden')

    completer = new GmapsCompleter
      mapElem: '#gmaps-canvas',
      inputField: '#gmaps-input-address',
      errorField: '#gmaps-error',
      zoomLevel: 5,
      mapType: 'roadmap',
      pos: [-42.1346221, 172.901246],
      debugOn: false
      assist: MyCompleterAssist

    completer.autoCompleteInit
      region: 'NZ',
      country: 'New Zealand',
      autocomplete:
        minLength: 4,
        position:
          my: "center top",
          at: "center bottom"
