evil.block '@@price_range',
  init: ->
    slider = @price_slider.slider(
      range: true
      min: 100
      max: 1000
      values: [
        250
        450
      ]
      slide: (event, ui) ->
        $('@amount').val '$' + ui.values[0] + ' - $' + ui.values[1]
        $('#min_price').val ui.values[0]
        $('#max_price').val ui.values[1]
    )
    @amount.val '$' + @price_slider.slider('values', 0) + ' - $' + @price_slider.slider('values', 1)

    $('#min_price').val slider.slider('values')[0]
    $('#max_price').val slider.slider('values')[1]
