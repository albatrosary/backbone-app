###
  (c) 2013-2014 albatrosary
  Notepad may be freely distributed under the MIT license.
  For all details and documentation:
  https://github.com/albatrosary/backbone-app
###
define [
  "jquery"
  "underscore"
  "backbone"
  "templates"
], ($, _, Backbone, JST) ->
  # Function-level strict mode syntax
  "use strict"
  class ListElementView extends Backbone.View

    el: $ "#main"

    template: JST["app/scripts/templates/title-list-elements.ejs"] 

    initialize: ->
      @listenTo @model, 'change', @render
      @listenTo @model, 'destroy', @remove
      return
    
    render: ->
      console.log "render"
      $("#notes-entry").html @template
        "title": @model.get "title"

    events:
      'click .delete': '_onClickDelete'
      
    _onClickDelete: ->
      @model.destroy() if confirm 'are you sure?'
