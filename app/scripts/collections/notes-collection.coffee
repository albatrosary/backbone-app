# global define
define [
  "underscore"
  "backbone"
  "../models/notes-model"
], (_, Backbone, NotesModel) ->
  "use strict"
  class NotesCollection extends Backbone.Collection
  	model: NotesModel
  	#localStorage: new Backbone.LocalStorage('notes-sample')
