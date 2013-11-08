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

  	# すでに存在する DOM エレメントを指定すること
    # el で定義された DOM が events で定義される検索対象になります
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

    # #added がクリックされたとき collection にあるモデルを更新する
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
      # model.set({title: $("#notes-text").val(), contents: $("#notes-contents").val()}, {silent: false} ,{validate: true})
      return
    
    # #added がクリックされたとき collection ヘ登録する
    _onClickAdded: ->
      ids = _.uniqueId "notes_"
      @collection.create
        id: ids
        title: $("#notes-text").val()
        contents: $("#notes-contents").val()
      , 
        validate: true
      $("#notes-id").val ids
      return