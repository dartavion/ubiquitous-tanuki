### istanbul ignore next ###
chai = require 'chai'
### istanbul ignore next ###
global.assert = chai.assert
### istanbul ignore next ###
global.should = chai.should()
### istanbul ignore next ###
chai.use require('sinon-chai')
### istanbul ignore next ###
global.expect = chai.expect
