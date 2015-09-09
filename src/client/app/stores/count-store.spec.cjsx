sinon = require 'sinon'
React = require 'react'
Reflux = require 'reflux'
CountStore = require './count-store'
CountActions = require '../actions/count-actions'

describe 'Count Store', ->
  before ->
    @countStub = sinon.stub CountStore, 'count'
    @countStub()

  it 'should count', (done) ->
    expect(CountStore.count).to.have.been.called

    done()
