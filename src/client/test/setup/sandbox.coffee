### istanbul ignore next ###
sinon = require('sinon')
### istanbul ignore next ###
_sandbox = sinon.sandbox.create()
### istanbul ignore next ###
afterEach () ->
  _sandbox.restore()
### istanbul ignore next ###
global.sandbox = _sandbox
