#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    (@get 'playerHand').on 'dealerTurn',( -> (@get 'dealerHand').playTurn()), @
    (@get 'dealerHand').on 'gameOver',( -> @findWinner()), @
    (@get 'playerHand').on 'busted',( -> (@set 'winner', 'dealer') @findWinner()), @
    (@get 'dealerHand').on 'busted',( -> (@set 'winner', 'player') @findWinner()), @
    @set 'winner', 'draw'

  findWinner: ->
    if @get 'winner' is undefined
      playerScore = (@get 'playerHand').scores()
      dealerScore = (@get 'dealerHand').scores()
      if playerScore > dealerScore
        @set 'winner', 'player'
      if playerScore < dealerScore
        @set 'winner', 'dealer'
    @trigger('displayWinner', this)









    #SAVE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    #good syntax
    # (@get 'playerHand').on 'dealerTurn',( -> console.log("received by app")), @
