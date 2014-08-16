@App.module "TestCommandsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Application
    initialize: (options) ->
      { commands, runner } = options

      commandsView = @getCommandsView commands

      @listenTo commandsView, "childview:pause:clicked", (iv, args) ->
        console.warn args

      @listenTo commandsView, "childview:revert:clicked", (iv, args) ->
        runner.revertDom(args.model)

      @show commandsView

    getCommandsView: (commands) ->
      new List.Commands
        collection: commands