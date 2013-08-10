Template.autosaurForm.events
  'submit': (e) ->
    e.preventDefault()

  'keyup': (e) ->
    textBox = $(e.target)
    value = $(textBox).val()
    Session.set 'autosaurText', value

