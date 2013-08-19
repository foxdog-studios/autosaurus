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

PLESIOSAUR = [
  '                '
  '         #####  '
  '        #x##### '
  '       #####  ##'
  '         ##  ## '
  '            ##  '
  '           ##   '
  '     #######    '
  '    #######     '
  ' ###########    '
  '    #########   '
  ' ########   #   '
  '#  ######       '
  '  ####  ##      '
  ' ###     #      '
  '#               '
]

PTERADACTYL = [
  '                '
  '                '
  '##              '
  '  ###           '
  '   #x######   ##'
  '######     #### '
  '    ##  ####### '
  '   ############ '
  '#########    ## '
  '##### ####      '
  ' ###    ###     '
  '       # #      '
  '       # #      '
  '                '
  '                '
  '                '
]

VELOCIRAPTOR = [
  '                '
  '  #######     # '
  '     ##x#     # '
  '  #######     # '
  '       ##     # '
  '      ##     #  '
  '    ###     #   '
  ' #####     #    '
  '#  ###    ##    '
  '  ###### ###    '
  ' #  ########    '
  '    # # ##      '
  '   #     #      '
  '   ##     #     '
  '     #    #     '
  ' ####   ###     '
]

STEGASAURUS = [
  '                '
  '                '
  '                '
  '                '
  '                '
  '     # # #      '
  '     ##### #    '
  '   # #######    '
  '   #########    '
  '   #########    '
  ' # ##########  #'
  '#x##############'
  ' ############## '
  '    # #  # #    '
  '                '
  '                '
]

TRICERATOPS = [
  '                '
  '                '
  '                '
  '          #     '
  '          #  #  '
  '    ####### #   '
  '   #########    '
  '  #########x# # '
  ' ############## '
  '  ############# '
  '   # #   # #    '
  '                '
  '                '
  '                '
  '                '
  '                '
]

PACHYCEPHALOSAURUS = [
  '                '
  '#               '
  '#               '
  '#     ##        '
  ' #  ######      '
  ' ##########     '
  ' ###########    '
  ' ############   '
  ' ######   # ##  '
  ' ##  ###  # ##  '
  '  #    #  # ####'
  '  #  ###    #x##'
  '  #  #      ### '
  '  #         #   '
  ' ##             '
  '                '
]

BRACHIOSAURUS = [
  ' ###            '
  ' #x##           '
  '#####           '
  '    #           '
  '    #           '
  '    #           '
  '    ##          '
  '    ##          '
  '    ##          '
  '    ###         '
  '    ###         '
  '    ####        '
  '    ########    '
  '    #########   '
  '   ## # # # #   '
  '   #  # # #  #  '
]


@Autosaurus = class Autosaurus
  constructor: (canvas) ->

  draw: (canvas, text) ->
    context = canvas.getContext '2d'
    width = canvas.width
    height = canvas.height
    hash = md5(text)
    color = "##{hash[-6..-1]}"
    context.fillStyle = color
    context.fillRect(0, 0, width, height)
    context.fillStyle = "##{hash[-12..-7]}"
    dinoHex = parseInt(hash[13], 16)
    image = @_getDinoImageFromHex(dinoHex)
    @_drawDinosaur \
      context, \
      image, \
      Math.floor(width / 16), \
      Math.floor(height / 16)

  _drawDinosaur: (context, arraryImage, xScale, yScale) ->
    for line, i in arraryImage
      for pixel, j in line
        if pixel == '#'
          context.fillRect(j * xScale, i * yScale, 1 * xScale, 1 * yScale)

  _getDinoImageFromHex: (dinoHex) ->
    if dinoHex < 2
      return TREX
    else if dinoHex < 4
      return PLESIOSAUR
    else if dinoHex < 6
      return PACHYCEPHALOSAURUS
    else if dinoHex < 8
      return PTERADACTYL
    else if dinoHex < 10
      return STEGASAURUS
    else if dinoHex < 12
      return TRICERATOPS
    else if dinoHex < 14
      return BRACHIOSAURUS
    else
      return VELOCIRAPTOR

