# global define
define [
  "jquery"
  "underscore"
  "backbone"
  "templates"
], ($, _, Backbone, JST) ->
  "use strict"
  class ListView extends Backbone.View

    el: $("#main")

    template: JST["app/scripts/templates/list.ejs"]

    initialize: () ->
      # ここでレンダリングしない
      #this.render()
      @listenTo @collection, 'add', @addOne # model が追加されたら
      @listenTo @collection, 'change', @changeOne # modelが更新されたら
      #this.listenTo this.collection, 'all', this.render # すべてのイベント
 
    render: () ->
      $("#notes-list").html @template
      @collection.each (item) ->
      	$("#notes-entry").append "<li>" + item.get("title") + "</li>"
 
    addOne: () ->
      @render()

    changeOne: () ->
      @render()
  