React = require 'react'
R = React.DOM

countStore = require('../../stores/countStore')

module.exports = React.createClass

  onMounted: (response) ->
    @setState
      data: response

  getInitialState: ->
    count: 0

  componentDidMount: ->
    countStore.listen (count) =>
      @setState
        count: count
    return

  render: ->
    return (
    # jshint ignore:start
      <div>
        <span>{@state.count}</span>
      </div>
    # jshint ignore:end
    )
