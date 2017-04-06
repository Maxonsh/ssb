evil.block '@@search',
  init: ->
    @country = @block.data('country')
    @region = @block.data('region')
    @init_address_search()

  init_address_search: ->
    completer = new GmapsCompleter
      inputField: @address

    completer.autoCompleteInit
      region: @region
      country: @country
      autocomplete:
        minLength: 4
        position:
          my: "center top"
          at: "center bottom"
