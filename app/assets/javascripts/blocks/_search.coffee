evil.block '@@search',
  init: ->
    completer = new GmapsCompleter
      inputField: '#gmaps-input-address',

    completer.autoCompleteInit
      region: 'AU',
      country: 'Australia',
      autocomplete:
        minLength: 4,
        position:
          my: "center top",
          at: "center bottom"
