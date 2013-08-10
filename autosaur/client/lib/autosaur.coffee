TREX = [
  '                '
  '   ####         '
  ' ###xx####      '
  ' ########x##    '
  ' ###########    '
  ' ##########     '
  ' ######         '
  '############    '
  '############### '
  '################'
  ' ###############'
  ' #  #  ##  #####'
  '#  #   ##  ##  #'
  '     ##   ##   #'
  '   #### ####    '
  '                '
]

@Autosaur = class Autosaur
  constructor: (canvas) ->

  draw: (canvas, text) ->
    context = canvas.getContext '2d'
    hash = md5(text)
    color = "##{hash[-6..-1]}"
    context.fillStyle = color
    context.fillRect(0, 0, 128, 128)
    context.fillStyle = "##{hash[-12..-7]}"
    @_drawDinosaur(context, TREX, 8)

  _drawDinosaur: (context, arraryImage, scale) ->
    for line, i in arraryImage
      for pixel, j in line
        if pixel == '#'
          context.fillRect(j * scale, i * scale, 1 * scale, 1 * scale)

