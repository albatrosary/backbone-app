###
  (c) 2013-2014 albatrosary
  Notepad may be freely distributed under the MIT license.
  For all details and documentation:
  https://github.com/albatrosary/backbone-app
###
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
