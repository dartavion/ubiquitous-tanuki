'use strict'
### istanbul ignore next ###
process.env.NODE_ENV = process.env.NODE_ENV || 'development'
### istanbul ignore next ###
express = require 'express'
### istanbul ignore next ###
config = require './config/environment'
### istanbul ignore next ###
app = express()
### istanbul ignore next ###
server = require('http').createServer app
### istanbul ignore next ###
require('./config/express')(app)
#require('./routes')(app)
### istanbul ignore next ###
server.listen config.port, config.ip, () ->
  console.log('Express server listening on %d, in %s mode', config.port, app.get('env'));
### istanbul ignore next ###
module.exports = app
