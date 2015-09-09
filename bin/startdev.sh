#!/usr/bin/env bash

# remove folders if they exist
[[ -d tmp  && ! -L tmp ]] && rm -rf tmp

mkdir -p tmp/client/scripts
mkdir -p tmp/client/styles
copyfiles -f node_modules/bootstrap/dist/css/bootstrap.css.map tmp/client/styles
copyfiles -f src/client/fonts/**/* tmp/client/fonts
copyfiles -f src/client/images/**/* tmp/client/images
copyfiles -f src/client/**/*.html tmp/client
coffee src/server/server.coffee &
watchify -t coffee-reactify --extension='.cjsx' --extension='.coffee' src/client/app.coffee -o tmp/client/scripts/app.js &
myth -cw src/client/app.css tmp/client/styles/app.css
