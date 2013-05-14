BaseView = require './base-view'

User = require 'zooniverse/models/user'

class Header extends BaseView

  template: require '../templates/layout/header'

  className: 'site-header'

  initialize: ->
    super
    @render()
    User.on 'change', @onUserChange

  onUserChange: (e, user) =>
    if user?
      @$el.find('.profile').text(user.name).addClass 'signed-in'

module.exports = Header