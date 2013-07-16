# global define
define [
  'jquery'
  'backbone'
  '../views/main-view'
  '../views/show-view'
  '../collections/notes-collection'
], ($, Backbone, MainViews, ShowViews, NotesCollections) ->
  'use strict'
  class NotesRouter extends Backbone.Router

    initialize: () ->
      @collection = new NotesCollections()

      @mview = new MainViews
        collection: @collection

      @sview = new ShowViews
        collection: @collection

    # localhost:9000/#main でコールすると mains関数が実行される
    routes:
      "main": "mains"
      "show": "shows"

    mains: () ->
      @mview.render()

    shows: () ->
      @sview.render()