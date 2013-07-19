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
  class ListView extends Backbone.View

    el: $ "#main"

    template: JST["app/scripts/templates/title-list.ejs"]

    templateElements: JST["app/scripts/templates/title-list-elements.ejs"] 

    initialize: ->
      # ここでレンダリングしない
      #this.render()
      @listenTo @collection, 'add', @addOne # model が追加されたら
      @listenTo @collection, 'change', @changeOne # modelが更新されたら
      #this.listenTo this.collection, 'all', this.render # すべてのイベント
      return
 
    render: ->
      debugger
      $("#notes-list").html @template
      # collection.each の中に定義された this が ListView に bind されるよう fat arrow で定義
      @collection.each (item) =>
      	$("#notes-entry").append @templateElements {"title": item.get "title"}
      this
 
    addOne: ->
      @render()

    changeOne: ->
      @render()