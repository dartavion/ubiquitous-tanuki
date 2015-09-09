'use strict'
### istanbul ignore next ###
StubRouterContext = (Component, props, stubs) ->

  RouterStub = ->

  Object.assign RouterStub, {
    makePath: ->
    makeHref: ->
    transitionTo: ->
    replaceWith: ->
    goBack: ->
    getCurrentPath: ->
    getCurrentRoutes: ->
    getCurrentPathname: ->
    getCurrentParams: ->
    getCurrentQuery: ->
    isActive: ->
    getRouteAtDepth: ->
    setRouteComponentAtDepth: ->

  }, stubs
  React.createClass
    childContextTypes:
      router: React.PropTypes.func
      routeDepth: React.PropTypes.number
    getChildContext: ->
      {
      router: RouterStub
      routeDepth: 0
      }
    render: ->
      React.createElement Component, props
### istanbul ignore next ###
module.exports = StubRouterContext
