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
  "use strict"
  class ListView extends Backbone.View

    el: $("#main")

    template: JST["app/scripts/templates/title-list.ejs"]

    initialize: () ->
      # ここでレンダリングしない
      #this.render()
      @listenTo @collection, 'add', @addOne # model が追加されたら
      @listenTo @collection, 'change', @changeOne # modelが更新されたら
      #this.listenTo this.collection, 'all', this.render # すべてのイベント
 
    render: () ->
      $("#notes-list").html @template
      @collection.each (item) ->
      	$("#notes-entry").append JST["app/scripts/templates/title-list-elements.ejs"] {"title": item.get("title")}
 
    addOne: () ->
      @render()

    changeOne: () ->
      @render()