# global define
define [
  "jquery"
  "underscore"
  "backbone"
  "templates"
  "./notes-view"
  "./list-view"
], ($, _, Backbone, JST, notes, lists) ->
  "use strict"
  class NotesView extends Backbone.View

    el: $("#main")

    initialize: () ->
      # ここでレンダリングしない！
      # メモ本体      
      @note = new notes { collection: @collection }
      #リスト
      @list = new lists { collection: @collection }

    render: () ->
      $("#main").html @template
      @note.render()
      @list.render()

    template: JST["app/scripts/templates/main.ejs"]
  