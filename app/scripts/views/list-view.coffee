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
  class ShowView extends Backbone.View

    el: $("#main")

    template: JST["app/scripts/templates/list.ejs"]

    # initialize でrenderをしない！！
    #initialize: () ->
    #  this.render()

    render: () ->
      $("#main").html @template
      @collection.each (item) ->
        $("#notes-list").append JST["app/scripts/templates/list-elements.ejs"] {"title": item.get("title"), "contents": item.get("contents")}
      #  "<li>" + item.get("title") + " <br> " + item.get("contents") + "</li>"


    