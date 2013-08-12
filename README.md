# Autosaurus

Automatically generate dinosaur images.

Given input text Renders an image of a dinosaur to an html `canvas` element.

The dinosaur is generated using the md5 hash of the input text.

input text -> md5 hash -> BINGO DINO DNA!

## Dependencies

- [Javascript MD5](https://github.com/blueimp/JavaScript-MD5)

## Usage

In a web page

    # Create an autosaurus
    var autosaurus = new Autosaurus();

    # Grab some canvas element
    var canvas = document.getElementById('myCanvas');

    # Pass the autosaurus a canvas to draw to and some text to generate an image
    # from.
    autosaurus.draw(canvas, 'Any text you like');


## Running the development environment

    npm install
    bower install
    grunt
