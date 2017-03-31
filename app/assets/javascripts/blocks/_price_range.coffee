evil.block '@@price_range',
  init: ->
    default_values = [250, 600]
    min_price = @block.data('min-price')
    max_price = @block.data('max-price')
    default_values = [min_price, max_price] if max_price?

    slider = @price_slider.slider(
      range: true
      min: 100
      max: 1000
      values: default_values
      slide: (event, ui) ->
        $('@amount').val '$' + ui.values[0] + ' - $' + ui.values[1]
        $('#min_price').val ui.values[0]
        $('#max_price').val ui.values[1]
    )
    @amount.val '$' + @price_slider.slider('values', 0) + ' - $' + @price_slider.slider('values', 1)

    $('#min_price').val slider.slider('values')[0]
    $('#max_price').val slider.slider('values')[1]
