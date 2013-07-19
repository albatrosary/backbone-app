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
  class NotesView extends Backbone.View

  	# TODO #notesとしたところ eventsハンドラーが取得できなかった
    el: $ "#main"

    template: JST["app/scripts/templates/notes.ejs"]

    events:
      'click #update': '_onClickUpdate'
      'click #added': '_onClickAdded'
    
    # ここでレンダリングしない
    #initialize: () ->
    #  this.render()

    render: ->
      $("#notes").html @template
      this

    _onClickUpdate: ->
      model = @collection.get
        id: $("#notes-id").val()
      model.set
      #  title:
      #  contents:
      #, silent: false
      #, validate: true
      # と
      #  title:
      #  contents:
      #,
      #  silent: false
      #, 
      #  validate: true
      # は意味が異なる
        title: $("#notes-text").val()
        contents: $("#notes-contents").val()
      , 
        silent: false
      ,
        validate: true
      return
      
    _onClickAdded: ->
      ids = _.uniqueId "notes_"
      @collection.add
        id: ids
        title: $("#notes-text").val()
        contents: $("#notes-contents").val()
      , 
        validate: true
      $("#notes-id").val ids
      return