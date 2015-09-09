'use strict'
### istanbul ignore next ###
path = require 'path'
### istanbul ignore next ###
_ = require 'lodash'
### istanbul ignore next ###
module.exports = _.merge(
  all =
    env: process.env.NODE_ENV
    port: process.env.PORT || 3000
    root: path.normalize(__dirname + '/../../../..')
    seedDB: false
    secrets:
      session: 'some-secret' #change to env var
      username: 'username@someplace.com'
      password: 'password'
  ,
  require('./' + process.env.NODE_ENV) || {})
