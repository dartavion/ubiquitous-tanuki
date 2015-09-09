'use strict'

React = require 'react'
mui = require 'material-ui'

ThemeManager = new mui.Styles.ThemeManager()
{ Card
  CardHeader
  CardMedia
  CardTitle
  CardActions
  CardText
  FlatButton
  Avatar
  Paper} = mui

Feed = React.createClass
  contextTypes: router: React.PropTypes.func
  childContextTypes: muiTheme: React.PropTypes.object

  getChildContext: ->
    muiTheme: ThemeManager.getCurrentTheme()

  getViewWidth: ->
    window.innerWidth

  getStyles: ->
    width: @getViewWidth() + 'px'
    margin: '10px'

  getCard: ->
    <div className="card">
      <Card>
        <CardHeader
          title="Title"
          subtitle="Subtitle"
          avatar={<Avatar>A</Avatar>}/>
        <CardHeader
          title="Demo Url Based Avatar"
          subtitle="Subtitle"
          avatar="http://lorempixel.com/100/100/nature/"/>
        <CardMedia overlay={<CardTitle title="Title" subtitle="Subtitle"/>}>
          <img src="http://lorempixel.com/600/337/nature/"/>
        </CardMedia>
        <CardTitle title="Title" subtitle="Subtitle"/>
        <CardActions>
          <FlatButton label="Action1"/>
          <FlatButton label="Action2"/>
        </CardActions>
        <CardText>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit.
          Donec mattis pretium massa. Aliquam erat volutpat. Nulla facilisi.
          Donec vulputate interdum sollicitudin. Nunc lacinia auctor quam sed pellentesque.
          Aliquam dui mauris, mattis quis lacus id, pellentesque lobortis odio.
        </CardText>
      </Card>
    </div>

  getCards: ->
    cards = []
    for card in [0..10]
      cards.push @getCard()
    cards

  render: ->
    (
      <div className="feed">
        {@getCards()}
      </div>
    )

module.exports = Feed
