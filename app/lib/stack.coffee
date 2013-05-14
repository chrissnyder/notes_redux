class Stack extends Backbone.Router

  views: []

  activeView: null

  initialize: ->
    @$el = $('<div>').addClass 'stack'

    for route, view of @routing
      @views.unshift (new view)
      @route route, @views[0]

    @$el.append view.render().el for view in @views

    @on 'route', @switch

    if @default? and not window.location.hash.slice(2)
      @navigate @default, { replace: true }

  switch: (view, params) =>
    if @activeView? then @activeView.deactivate()
    @activeView = view
    @activeView.activate()

module.exports = Stack