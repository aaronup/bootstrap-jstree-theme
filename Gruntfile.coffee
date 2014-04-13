module.exports = (grunt) ->
    "use strict"
    @initConfig(
        pkg: @file.readJSON( 'package.json' )
        newer:
            options:
                cache: '.cache'
        clean: ['build']
        copy: 
            src:
                expand: true
                flatten: false
                cwd: 'src/themes'
                src: [
                    '**'
                    '!**.scss'
                ]
                dest: 'build/themes/bootstrap'
        compass:
            compile:
                options:
                    basePath: 'build/themes/bootstrap'
                    sassDir: '../../../src/themes'
                    images: ''
                    cssDir: ''
                    outputStyle: 'expanded'
                    relativeAssets: true
        watch:
            styles:
                files: ['src/themes/**/*.scss']
                tasks: ['compass:compile']
    )

    @loadNpmTasks( 'grunt-newer' )
    @loadNpmTasks( 'grunt-contrib-clean' )
    @loadNpmTasks( 'grunt-contrib-copy' )
    @loadNpmTasks( 'grunt-contrib-compass' )
    @loadNpmTasks( 'grunt-contrib-watch' )

    @registerTask( 'default', ['clean', 'copy', 'compass', 'watch'] )
    return
