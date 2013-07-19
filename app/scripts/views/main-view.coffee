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
  "./notes-view"
  "./title-list-view"
], ($, _, Backbone, JST, Notes, Titlelists) ->
  # Function-level strict mode syntax
  "use strict"
  class NotesView extends Backbone.View

    el: $("#main")

    template: JST["app/scripts/templates/main.ejs"]
    
    initialize: () ->
      # ここでレンダリングしない！
      # メモ本体
      @note = new Notes { collection: @collection }
      #リスト
      @titlelist = new Titlelists { collection: @collection }

    render: () ->
      $("#main").html @template
      @note.render()
      @titlelist.render()

  