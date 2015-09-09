Reflux = require('reflux')

countActions = require('../actions/count-actions')

module.exports = Reflux.createStore

  count: () =>
    @counter += 1

