module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      coffeeCompile:
        expand: true,
        flatten: true,
        cwd: 'src/coffee/',
        src: ['*.coffee'],
        dest: 'build/',
        ext: '.js'
    connect:
      server:
        options:
          port: 8080
    copy:
      js_vendor:
        files: [
          expand: true
          flatten: true
          cwd: 'bower_components'
          src: [
            'blueimp-md5/js/md5.js'
          ]
          dest: 'build/'
        ]
    watch:
      files: [
        'src/**/*'
        'index.html'
      ]
      tasks: ['coffee', 'copy']
      options:
        livereload: true

  npmTasks = [
    'grunt-contrib-coffee'
    'grunt-contrib-connect'
    'grunt-contrib-copy'
    'grunt-contrib-watch'
  ]

  for task in npmTasks
    grunt.loadNpmTasks(task)
  grunt.registerTask('default', ['coffee', 'copy', 'connect', 'watch'])

