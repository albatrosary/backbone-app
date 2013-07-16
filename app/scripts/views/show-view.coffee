# global define
define [
  "jquery"
  "underscore"
  "backbone"
  "templates"
], ($, _, Backbone, JST) ->
  "use strict"
  class ShowView extends Backbone.View

    el: $("#main")

    # initialize でrenderをしない！！
    #initialize: () ->
    #  this.render()

    render: () ->
      $("#main").html @template
      @collection.each (item) ->
        $("#notes-list").append JST["app/scripts/templates/show-elements.ejs"] {"title": item.get("title"), "contents": item.get("contents")}
      #  "<li>" + item.get("title") + " <br> " + item.get("contents") + "</li>"

    template: JST["app/scripts/templates/show.ejs"]

    