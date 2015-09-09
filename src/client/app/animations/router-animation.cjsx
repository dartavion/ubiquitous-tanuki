'use strict'
React = require 'react/addons'
TM = require 'gsap/src/uncompressed/TweenMax'

RouterAnimation = React.createClass
  render: () ->
    return @props.children

  componentWillAppear: (callback) ->
    callback()

  componentDidAppear: () ->

  componentWillEnter: (callback) ->
    el = @getDOMNode()


    el.classList.add(@props.prefix + '-enter')
    el.classList.add(@props.prefix + '-enter-active')

    if (not el.classList.contains 'toggled')
      TweenMax.fromTo el, .5, {x: window.innerWidth, position: 'absolute', zIndex: 2, autoAlpha: 0, transformStyle:"preserve-3d", ease: Back.easeOut}, {x: 0, autoAlpha: 1, onComplete: () ->
        el.classList.remove('toggled')
        callback()
      }
    else
      TweenMax.fromTo el, .5, {x: 0, position: 'absolute', zIndex: 2, transformStyle:"preserve-3d", ease: Back.easeOut}, {x: window.innerWidth, onComplete: () ->
        callback()
      }

  componentDidEnter: () ->
    el = @getDOMNode()

    el.classList.remove(@props.prefix + '-enter')
    el.classList.remove(@props.prefix + '-enter-active')

  componentWillLeave: (callback) ->

    el = @getDOMNode()

    el.classList.add(@props.prefix + '-leave')
    el.classList.add(@props.prefix + '-leave-active')

    TweenMax.fromTo el, .3, {x: 0, position: 'absolute', zIndex: 2000, autoAlpha: 1, transformStyle:"preserve-3d", ease: Back.easeOut}, {x: window.innerWidth, autoAlpha: 0, onComplete: () ->
        callback()
      }

  componentDidLeave: () ->
    el = @getDOMNode()

    el.classList.remove(@props.prefix + '-leave')
    el.classList.remove(@props.prefix + '-leave-active')

module.exports = RouterAnimation
