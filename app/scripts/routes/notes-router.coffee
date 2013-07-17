###
  (c) 2013-2014 albatrosary
  Notepad may be freely distributed under the MIT license.
  For all details and documentation:
  https://github.com/albatrosary/backbone-app
###
define [
  'jquery'
  'backbone'
  '../views/main-view'
  '../views/list-view'
  '../collections/notes-collection'
], ($, Backbone, MainViews, ListViews, NotesCollections) ->
  'use strict'
  class NotesRouter extends Backbone.Router

    initialize: () ->
      @collection = new NotesCollections()

      @mview = new MainViews
        collection: @collection

      @lview = new ListViews
        collection: @collection

    # localhost:9000/#main でコールすると mains関数が実行される
    routes:
      "main": "mains"
      "show": "lists"

    mains: () ->
      @mview.render()

    lists: () ->
      @lview.render()