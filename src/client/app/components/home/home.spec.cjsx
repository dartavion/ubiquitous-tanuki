React = require 'react'
Home = require './home.cjsx'
HomeFactory = React.createFactory Home
TestUtils = require('react/addons').addons.TestUtils
TestHelpers = require('../../../test/helpers')

describe 'Hello View', ->
  $home = {}
  handleClick = {}

  beforeEach ->
    handleClick = TestHelpers.stubMethod(Home, "handleClick")
    $home = React.render HomeFactory(), @container

  it 'said hello', (done) ->
    hello = React.findDOMNode($home.refs.hello)
    expect(hello.textContent).to.equal($home.state.data.hello)
    done()

  it 'should say hello', (done) ->
    hello = React.findDOMNode($home.refs.hello)
    TestUtils.Simulate.click($home.refs.sayHello.getDOMNode())
    expect(handleClick).to.have.been.called
    expect(hello.textContent).to.equal($home.state.data.hello)
    done()
