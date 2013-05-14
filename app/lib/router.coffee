
Home = require '../views/home'
Collections = require '../views/collections'
Team = require '../views/team'

class Site extends Backbone.Stack

  routing:
    '': Home
    'collections': Collections
    'team': Team

  default: ''

module.exports = Site