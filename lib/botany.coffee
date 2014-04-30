BotanyView = require "./botany-view"

module.exports =
  view: null

  activate: (state) ->
    return if not atom.project.getRepo()?
    @view = new BotanyView(state.botanyViewState)
    atom.workspaceView.command "botany:toggle", => @view.toggle()

  deactivate: ->
    @view.destroy()

  serialize: ->
    botanyViewState: @view.serialize()
