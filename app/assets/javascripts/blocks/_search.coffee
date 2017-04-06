evil.block '@@search',
  'change on @country_select': (e) ->
    country = @country_select.val()

    if this["init_#{country.toLowerCase().replace(/ /g,"_")}_address_search"]?
      this["init_#{country.toLowerCase().replace(/ /g,"_")}_address_search"]()
    else
      @address.addClass('hidden')

  init_australia_address_search: ->
    @address.removeClass('hidden')

    completer = new GmapsCompleter
      inputField: @address

    completer.autoCompleteInit
      region: 'AU'
      country: 'Australia'
      autocomplete:
        minLength: 4
        position:
          my: "center top"
          at: "center bottom"

  init_new_zealand_address_search: ->
    @address.removeClass('hidden')

    completer = new GmapsCompleter
      inputField: @address

    completer.autoCompleteInit
      region: 'NZ'
      country: 'New Zealand'
      autocomplete:
        minLength: 4
        position:
          my: "center top"
          at: "center bottom"
