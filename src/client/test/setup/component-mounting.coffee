### istanbul ignore next ###
React = require 'react';
### istanbul ignore next ###
beforeEach () ->
  testArea = document.querySelector('#test-area')
  if testArea then @container = testArea
  else @container = document.createElement('div')
### istanbul ignore next ###
afterEach () ->
  React.unmountComponentAtNode @container
