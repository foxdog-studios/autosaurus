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
    hash = md5(text)
    color = "##{hash[-6..-1]}"
    context.fillStyle = color
    context.fillRect(0, 0, 128, 128)
    context.fillStyle = "##{hash[-12..-7]}"
    dinoHex = parseInt(hash[13], 16)
    image = @_getDinoImageFromHex(dinoHex)
    @_drawDinosaur(context, image, 8)

  _drawDinosaur: (context, arraryImage, scale) ->
    for line, i in arraryImage
      for pixel, j in line
        if pixel == '#'
          context.fillRect(j * scale, i * scale, 1 * scale, 1 * scale)

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

