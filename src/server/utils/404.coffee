### istanbul ignore next ###
module.exports = () ->
  api = '/api/'

  notFoundMiddleware = (req, res, next) ->
    send404 req, res, 'API endpoint not found'

  send404 = (req, res, description) ->
    data =
      status: 404
      message: 'Not Found'
      description: description
    res.status(404)
    .send(data)
    .end()

  service =
    notFoundMiddleware: notFoundMiddleware
    send404: send404

  return service
