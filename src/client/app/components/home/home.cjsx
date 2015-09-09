React = require 'react'
mui = require 'material-ui'
Router = require 'react-router'
ThemeManager = new mui.Styles.ThemeManager()
injectTapEventPlugin = require("react-tap-event-plugin")
injectTapEventPlugin()
RaisedButton = mui.RaisedButton

Home = React.createClass

  contextTypes: router: React.PropTypes.func
  childContextTypes: muiTheme: React.PropTypes.object

  getChildContext: ->
    muiTheme: ThemeManager.getCurrentTheme()

  getInitialState: ->
    data:
      hello: 'Hello'

  handleClick: ->
    @context.router.transitionTo 'feed'
    @setState
      data:
        hello: 'Welcome!'

  render: ->
    return (
      # jshint ignore:start
      <div className="home">
        <div ref="hello">{@state.data.hello}</div>
        <RaisedButton label="Say It!!!" primary={true} onClick={@handleClick} />

      </div>
      # jshint ignore:end
    )

module.exports = Home
