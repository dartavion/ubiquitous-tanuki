React = require 'react'
CountActions = require './count-actions.cjsx'

describe 'Count Actions', ->
  requiredProps = [
    'count'
    ]

  it 'should have required properties', (done) ->
    CountActions.should.have.keys(requiredProps)
    done()
