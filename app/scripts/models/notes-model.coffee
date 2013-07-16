# global define
define [
  "underscore"
  "backbone"
], (_, Backbone) ->
  "use strict"
  class NotesModel extends Backbone.Model
  	
  	defaults:
  	  id: 0
  	  title: 'title'
  	  contents: 'contents'

    validate: (attrs) ->
      return 'title is empty.' if _.isEmpty attrs.title
      return 'contents is empty.' if _.isEmpty attrs.contents
