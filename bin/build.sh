#!/usr/bin/env bash

# remove folders if they exist
[[ -d build  && ! -L build ]] && rm -rf build

# create folders
mkdir -p build/client/scripts
mkdir build/client/styles
mkdir build/client/images
mkdir build/client/fonts

mkdir tmp
# js
echo "Compiling Coffeescript"
cjsx -o tmp -c src
echo "Concatenating using browserify"
browserify tmp/client/app.js | uglifyjs -m -c -o build/client/scripts/app.js
# watchify tmp/client/app.js -do build/client/scripts/app.js
#css
echo "Building CSS and compressing"
myth -c src/client/app.css build/client/styles/app.css
echo "Copying HTML"
copyfiles -f src/client/**/*.html build/client
echo "Copying Images"
copyfiles -f src/client/images/**/* build/client/images
echo "Copying Fonts"
copyfiles -f src/client/fonts/**/* build/client/fonts
echo "Copying Bootstrap map"
copyfiles -f node_modules/bootstrap/dist/css/bootstrap.css.map build/client/styles
echo "Moving server"
cp -rf tmp/server/ build/server
echo "Copying Server ICO"
copyfiles -f src/server/favicon.ico build/server
#echo "Removing TMP dir"
#rm -rf tmp
echo "All Set!!!"
