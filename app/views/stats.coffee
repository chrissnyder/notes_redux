BaseView = require './base-view'
Project = require 'zooniverse/models/project'

class Stats extends BaseView

  template: require '../templates/stats'

  initialize: ->
    Project.on 'base-fetch', (e, @data) =>
      @data = _.extend @data, @
      @render()

  collectionsAvailable: =>
    @_formatNumber 2

  totalTranscriptions: =>
    @_formatNumber Project.current.classification_count

  transcriptionProgress: =>
    '35%'

  usersContributing: =>
    @_formatNumber Project.current.user_count

  _formatNumber: (n) ->
    return n unless n
    n.toString().replace /(\d)(?=(\d{3})+(?!\d))/g, '$1,'

module.exports = Stats