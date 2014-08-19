class window.AppView extends Backbone.View

  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    "click .hit-button": -> @model.get('playerHand').hit()
    "click .stand-button": -> @model.get('playerHand').stand()

  initialize: ->
    @render()
    @model.on 'displayWinner',( ->
      winner = @model.get 'winner'
      if winner is "player" then alert("You Won!")
      if winner is "dealer" then alert("To bad try again!")
      if winner is "draw" then alert("push, try again")
    ), @
    @model.on 'disableButtons',( -> @stopPlayerInteraction()), @

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

  stopPlayerInteraction: ->
    @.undelegateEvents()


