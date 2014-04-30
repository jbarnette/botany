{$$, SelectListView} = require "atom"

module.exports =
class BotanyView extends SelectListView
  initialize: (state) ->
    super; @addClass "botany overlay from-top"

  attach: ->
    repo = atom.project.getRepo()
    refs = repo.getReferences()

    atom.workspaceView.append(this)
    @focusFilterEditor()
    @setItems(refs.heads)

  confirmed: (head) ->
    repo = atom.project.getRepo()

    if repo.checkoutReference(head, false)
      @cancel()

  toggle: ->
    if @hasParent() then @cancel() else @attach()

  viewForItem: (item) ->
    $$ -> @li "#{item}"
