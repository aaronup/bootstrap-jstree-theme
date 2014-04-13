# jsTree Bootstrap Theme
This theme works with jsTree version ~3.0.x. It is built using SASS and Compass (SCSS Variant). It provides only a single theme, bootstrap. You'll need nodejs to build it.

# Installation
Its pretty easy to get this working.
### The fast and RECOMMENDED way
It is highly recommended that you install this via bower so you only get the intended distribution files.
```sh
$ bower install --save bootstrap-jstree-theme
```

### The manual way
```sh
$ git clone $REPO_URL
$ cd $REPO_PATH
$ npm install
$ bower install
$ grunt build
$ cp dist $YOUR_PROJECT_PATHS_PUBLIC
```


# Testing
```sh
$ npm install
$ bower install
$ grunt
$ python -m SimpleHTTPServer
$ open "http://0.0.0.0:8000/test/index.html"
```
