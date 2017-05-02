evil.block '@@images_upload',
  'change on @file_field': (e) ->
    @handle_file_select(e)

  handle_file_select: (e) ->
    files = e.target.files

    i = 0
    while f = files[i]
      if !f.type.match('image.*')
        i++
        continue

      reader = new FileReader

      reader.onload = ((theFile) ->
        (e) ->
          span = document.createElement('span')

          span.innerHTML = [
            '<img class="thumb" src="'
            e.target.result
            '" title="'
            escape(theFile.name)
            '"/>'
          ].join('')
          $(span).insertBefore($('@list'))
      )(f)

      reader.readAsDataURL f
      i++
