# global define
define [
  "jquery"
  "underscore"
  "backbone"
  "templates"
], ($, _, Backbone, JST) ->
  "use strict"
  class NotesView extends Backbone.View

  	# TODO #notesとしたところ eventsハンドラーが取得できなかった
    el: $("#main")

    events:
      'click #update': '_onClickUpdate'
      'click #added': '_onClickAdded'
    
    template: JST["app/scripts/templates/notes.ejs"]

    # ここでレンダリングしない
    #initialize: () ->
    #  this.render()

    render: () ->
      $("#notes").html @template

    _onClickUpdate: () ->
      model = @collection.get {id: $("#notes-id").val()}
      model.set (
        {
          title: $("#notes-text").val()
          contents: $("#notes-contents").val()
        }
        { silent: false }
        { validate: true }
      )

    _onClickAdded: () ->
      ids = _.uniqueId "notes_"
      @collection.add (
        {
          id: ids
          title: $("#notes-text").val()
          contents: $("#notes-contents").val()
        }
        { validate: true }
      )
      $("#notes-id").val ids
      