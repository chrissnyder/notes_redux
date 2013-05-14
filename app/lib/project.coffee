Project = require 'zooniverse/models/project'

class NotesProject extends Project

  constructor: ->
    super
    
    for own methodName, method of @
      @::[methodName] = method

  collectionsAvailable: =>
    @_formatNumber 2

  totalTranscriptions: =>
    @_formatNumber 10000

  transcriptionProgress: =>
    '35%'

  usersContributing: =>
    @_formatNumber 2000

  _formatNumber: (n) ->
    return n unless n
    n.toString().replace /(\d)(?=(\d{3})+(?!\d))/g, '$1,'

module.exports = NotesProject