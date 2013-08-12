(function() {
  var Autosaurus, BRACHIOSAURUS, PACHYCEPHALOSAURUS, PLESIOSAUR, PTERADACTYL, STEGASAURUS, TREX, TRICERATOPS, VELOCIRAPTOR;

  TREX = ['                ', '   ####         ', ' ###xx####      ', ' ########x##    ', ' ###########    ', ' ##########     ', ' ######         ', '############    ', '############### ', '################', ' ###############', ' #  #  ##  #####', '#  #   ##  ##  #', '     ##   ##   #', '   #### ####    ', '                '];

  PLESIOSAUR = ['                ', '         #####  ', '        #x##### ', '       #####  ##', '         ##  ## ', '            ##  ', '           ##   ', '     #######    ', '    #######     ', ' ###########    ', '    #########   ', ' ########   #   ', '#  ######       ', '  ####  ##      ', ' ###     #      ', '#               '];

  PTERADACTYL = ['                ', '                ', '##              ', '  ###           ', '   #x######   ##', '######     #### ', '    ##  ####### ', '   ############ ', '#########    ## ', '##### ####      ', ' ###    ###     ', '       # #      ', '       # #      ', '                ', '                ', '                '];

  VELOCIRAPTOR = ['                ', '  #######     # ', '     ##x#     # ', '  #######     # ', '       ##     # ', '      ##     #  ', '    ###     #   ', ' #####     #    ', '#  ###    ##    ', '  ###### ###    ', ' #  ########    ', '    # # ##      ', '   #     #      ', '   ##     #     ', '     #    #     ', ' ####   ###     '];

  STEGASAURUS = ['                ', '                ', '                ', '                ', '                ', '     # # #      ', '     ##### #    ', '   # #######    ', '   #########    ', '   #########    ', ' # ##########  #', '#x##############', ' ############## ', '    # #  # #    ', '                ', '                '];

  TRICERATOPS = ['                ', '                ', '                ', '          #     ', '          #  #  ', '    ####### #   ', '   #########    ', '  #########x# # ', ' ############## ', '  ############# ', '   # #   # #    ', '                ', '                ', '                ', '                ', '                '];

  PACHYCEPHALOSAURUS = ['                ', '#               ', '#               ', '#     ##        ', ' #  ######      ', ' ##########     ', ' ###########    ', ' ############   ', ' ######   # ##  ', ' ##  ###  # ##  ', '  #    #  # ####', '  #  ###    #x##', '  #  #      ### ', '  #         #   ', ' ##             ', '                '];

  BRACHIOSAURUS = [' ###            ', ' #x##           ', '#####           ', '    #           ', '    #           ', '    #           ', '    ##          ', '    ##          ', '    ##          ', '    ###         ', '    ###         ', '    ####        ', '    ########    ', '    #########   ', '   ## # # # #   ', '   #  # # #  #  '];

  this.Autosaurus = Autosaurus = (function() {
    function Autosaurus(canvas) {}

    Autosaurus.prototype.draw = function(canvas, text) {
      var color, context, dinoHex, hash, image;
      context = canvas.getContext('2d');
      hash = md5(text);
      color = "#" + hash.slice(-6);
      context.fillStyle = color;
      context.fillRect(0, 0, 128, 128);
      context.fillStyle = "#" + hash.slice(-12, -6);
      dinoHex = parseInt(hash[13], 16);
      image = this._getDinoImageFromHex(dinoHex);
      return this._drawDinosaur(context, image, 8);
    };

    Autosaurus.prototype._drawDinosaur = function(context, arraryImage, scale) {
      var i, j, line, pixel, _i, _len, _results;
      _results = [];
      for (i = _i = 0, _len = arraryImage.length; _i < _len; i = ++_i) {
        line = arraryImage[i];
        _results.push((function() {
          var _j, _len1, _results1;
          _results1 = [];
          for (j = _j = 0, _len1 = line.length; _j < _len1; j = ++_j) {
            pixel = line[j];
            if (pixel === '#') {
              _results1.push(context.fillRect(j * scale, i * scale, 1 * scale, 1 * scale));
            } else {
              _results1.push(void 0);
            }
          }
          return _results1;
        })());
      }
      return _results;
    };

    Autosaurus.prototype._getDinoImageFromHex = function(dinoHex) {
      if (dinoHex < 2) {
        return TREX;
      } else if (dinoHex < 4) {
        return PLESIOSAUR;
      } else if (dinoHex < 6) {
        return PACHYCEPHALOSAURUS;
      } else if (dinoHex < 8) {
        return PTERADACTYL;
      } else if (dinoHex < 10) {
        return STEGASAURUS;
      } else if (dinoHex < 12) {
        return TRICERATOPS;
      } else if (dinoHex < 14) {
        return BRACHIOSAURUS;
      } else {
        return VELOCIRAPTOR;
      }
    };

    return Autosaurus;

  })();

}).call(this);
