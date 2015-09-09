React = require 'react/addons'
Router = require 'react-router'
{ Route, RouteHandler } = Router
TransitionGroup = require 'react/lib/ReactTransitionGroup'
RouterAnimation = require './animations/router-animation'
mui = require 'material-ui'

ThemeManager = new mui.Styles.ThemeManager()
{ AppBar } = mui
Layout = React.createClass
  contextTypes: router: React.PropTypes.func
  childContextTypes: muiTheme: React.PropTypes.object

  getChildContext: ->
    muiTheme: ThemeManager.getCurrentTheme()
  render: ->
    routeStack = @context.router.getCurrentRoutes()
    name = routeStack[routeStack.length - 1].name
    return (
      <div>
        <AppBar
          title="Title"
          style={position: 'absolute', top: 0, left: 0}
          iconClassNameRight="muidocs-icon-navigation-expand-more" />
        <TransitionGroup className="page-container" component="div">
          <RouterAnimation key={name} prefix="page">
            <RouteHandler />
          </RouterAnimation>
        </TransitionGroup>
      </div>
    )

module.exports = Layout
