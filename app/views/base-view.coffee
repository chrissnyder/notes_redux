
class BaseView extends Backbone.View

  data: null
  
  initialize: ->
    super
    @$el.addClass @className if @className

  assign: (selector, view) ->
    if _.isObject selector
      selectors = selector
    else
      selectors = {}
      selectors[selector] = view
    
    if !selectors then return

    _.each selectors, (view, selector) =>
      view.setElement(@$(selector)).render()

  render: =>
    @$el.html @template @data
    @

  activate: =>
    @$el.addClass 'active'

  deactivate: =>
    @$el.removeClass 'active'


module.exports = BaseView