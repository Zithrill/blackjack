#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    (@get 'playerHand').on 'dealerTurn',( -> (@get 'dealerHand').playTurn()), @
    (@get 'dealerHand').on 'gameOver',( -> console.log 'game over'), @
    @set 'winner', undefined

  findWinner: ->
    playerScore = (@get 'playerHand').scores()
    dealerScore = (@get 'dealerHand').scores()
    if playerScore < 21 && dealerScore > 21
      @set 'winner', 'player'
    if playerScore < 21 && dealerScore < 21 && playerScore > dealerScore
      @set 'winner', 'player'
    if playerScore








    #SAVE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    #good syntax
    # (@get 'playerHand').on 'dealerTurn',( -> console.log("received by app")), @
