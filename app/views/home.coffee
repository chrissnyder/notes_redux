Project = require 'zooniverse/models/project'

BaseView = require './base-view'
StatsView = require './stats'

class Home extends BaseView

  className: 'home'
  template: require '../templates/home'

  initialize: ->
    @statsView = new StatsView
    super

    Project.on 'base-fetch', (e, @data) =>
      @$el.find('#users-participating').text @data.user_count

  render: =>
    @$el.html @template @data
    @assign '#stats', @statsView
    @

module.exports = Home