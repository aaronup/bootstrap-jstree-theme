module.exports = (grunt) ->
    "use strict"
    @initConfig(
        pkg: @file.readJSON( 'package.json' )
        newer:
            options:
                cache: '.cache'
        clean: 
            build: ['build']
            dist: ['dist']
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
            dist:
                expand: true
                flatten: false
                cwd: 'build'
                src: [
                    '**',
                    '!**.css'
                ]
                dest: 'dist'
            distmin:
                src: 'build/themes/bootstrap/style.css'
                dest: 'dist/themes/bootstrap/style.min.css'
            distcss:
                src: 'build/themes/bootstrap/style.css'
                dest: 'dist/themes/bootstrap/style.css'
        compass:
            development:
                options:
                    basePath: 'build/themes/bootstrap'
                    sassDir: '../../../src/themes'
                    images: ''
                    cssDir: ''
                    outputStyle: 'expanded'
                    environment: 'development'
                    relativeAssets: true
            expanded:
                options:
                    basePath: 'build/themes/bootstrap'
                    sassDir: '../../../src/themes'
                    images: ''
                    cssDir: ''
                    outputStyle: 'expanded'
                    environment: 'production'
                    relativeAssets: true
            production:
                options:
                    basePath: 'build/themes/bootstrap'
                    sassDir: '../../../src/themes'
                    images: ''
                    cssDir: ''
                    outputStyle: 'compressed'
                    environment: 'production'
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

    @registerTask( 'default', ['clean', 'copy:src', 'compass:development', 'watch'] )
    @registerTask( 'build', [
        'clean'
        'copy:src'
        'compass:production'
        'copy:dist'
        'copy:distmin'
        'clean:build'
        'copy:src'
        'compass:expanded'
        'copy:distcss'
    ] )
    return
