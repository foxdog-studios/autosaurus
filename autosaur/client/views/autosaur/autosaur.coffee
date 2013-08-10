Template.autosaur.rendered = ->
  canvas = @find('#autosaur')
  canvas.width = 128
  canvas.height = 128
  if @handle
    return
  autosaur = new Autosaur()
  @handle = Deps.autorun ->
    text = Session.get 'autosaurText'
    unless text?
      return
    autosaur.draw canvas, text

