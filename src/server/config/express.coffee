'use strict'
### istanbul ignore next ###
express = require 'express'
### istanbul ignore next ###
bodyParser = require 'body-parser'
### istanbul ignore next ###
favicon = require 'serve-favicon'
### istanbul ignore next ###
logger = require 'morgan'
### istanbul ignore next ###
compression = require 'compression'
### istanbul ignore next ###
methodOverride = require 'method-override'
### istanbul ignore next ###
path = require 'path'
### istanbul ignore next ###
config = require './environment'
### istanbul ignore next ###
cors = require 'cors'
### istanbul ignore next ###
bs = require('browser-sync').create()
### istanbul ignore next ###
four0four = require '../utils/404'
### istanbul ignore next ###
server = (app) ->
  app.use cors()
  app.use express.static config.root + '/build/client/'
  app.use express.static './'
  app.use express.static './tmp'
  app.use '/app/*', (req, res, next) ->
    four0four.send404 req, res
#  app.use '/*', express.static config.root + '/build/client/index.html'
### istanbul ignore next ###
devServer = (app) ->
  console.log("started dev server:::::::::::::::::::::::::::::")
  app.use cors()
  app.use express.static config.root + '/tmp/client/'
  app.use '/app/*', (req, res, next) ->
    four0four.send404 req, res
  bs.init
    server: config.root + '/tmp/client'
    middleware: [app]
  bs.watch('tmp/client/scripts/*.js').on('change', bs.reload)

### istanbul ignore next ###
createExpressServer = (app) ->
  env = app.get('env')

  app.use favicon __dirname + '/../favicon.ico'
  app.use bodyParser.urlencoded
    extended: true

  app.use compression()
  app.use methodOverride()
  app.use bodyParser.json()
  app.use logger('dev')
  app.set('appPath', 'build/client')

  switch env
    when 'production' then server(app)
    else devServer(app)
### istanbul ignore next ###
module.exports = createExpressServer


