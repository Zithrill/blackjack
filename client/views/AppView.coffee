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
    @model.on 'displayWinner',( -> (console.log(@model.get 'winner'))), @
    # @model.on 'displayWinner',( -> (alert "The winner is #{ @model.get('winner') }")), @
    # (@get 'playerHand').on 'busted',( -> (@set 'winner', 'dealer')), @
    @model.on 'disableButtons',( -> @stopPlayerInteraction()), @

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

  stopPlayerInteraction: ->
    console.log("stop player!")
    @.undelegateEvents()
