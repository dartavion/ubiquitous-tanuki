### istanbul ignore next ###
jsdom = require('jsdom').jsdom
### istanbul ignore next ###
global.document = jsdom()
### istanbul ignore next ###
global.window = document.parentWindow
### istanbul ignore next ###
global.navigator = window.navigator
