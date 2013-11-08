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
  "../views/title-list-elements-view"
], ($, _, Backbone, JST, ListElementView) ->
  # Function-level strict mode syntax
  "use strict"
  class ListView extends Backbone.View

    el: $ "#main"

    template: JST["app/scripts/templates/title-list.ejs"]

    initialize: ->
      # ここでレンダリングしない
      #this.render()
      @listenTo @collection, 'add', @addOne # model が追加されたら
      @listenTo @collection, 'change', @changeOne # modelが更新されたら
      @listenTo @collection, 'destroy', @deleteOne # modelが削除されたら
      #this.listenTo this.collection, 'all', this.render # すべてのイベント
      # 関数が void 相当の場合 return と記載
      return
    
    events:
      'click .delete': '_onClickDelete'

    render: ->
      $("#notes-list").html @template
      # collection.each の中に定義された this が ListView に bind されるよう fat arrow で定義
      #@collection.each (item) =>
      #	$("#notes-entry").append @templateElements
      #    "title": item.get "title"
      # 関数の戻りとして return this をする場合 this と記載
      this
 
    # 関数の戻りとして関数の結果を返却する場合何も書かない
    addOne: (models)->
      console.log models
      view = new ListElementView({model: models});
      view.render()

    changeOne: (models)->
      console.log models

    deleteOne: ->
      @render()