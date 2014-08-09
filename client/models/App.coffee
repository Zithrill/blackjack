#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    # set default game result to draw
    @set 'winner', 'draw'

    # player busts before Dealer's turn
    (@get 'playerHand').on 'busted',( ->
      (@set 'winner', 'dealer')
      @trigger('disableButtons', this)
      @trigger('displayWinner', this)), @

    # player has blackjack
    (@get 'playerHand').on 'blackjack',( ->
      (@set 'winner', 'player')
      @trigger('disableButtons', this)
      @trigger('displayWinner', this)), @

    # player stands and passes over to dealer
    (@get 'playerHand').on 'dealerTurn',( ->
      @trigger('disableButtons', this)
      (@get 'dealerHand').playTurn()), @

    # dealer plays and busts
    (@get 'dealerHand').on 'busted',( ->
      (@set 'winner', 'player')
      @trigger('disableButtons', this)
      @trigger('displayWinner', this)), @

    # dealer plays and score is >= 17
    (@get 'dealerHand').on 'gameOver',( -> @findWinner()), @

    # check for blackjack upon initialization
    setTimeout((=> this.get('playerHand').hasBlackJack()), 100)


    # setTimeout(function() {
    #   return this.get('playerHand').hasBlackJack();
    # }, 1000);

  findWinner: ->
    # if playerScore.length = 1, then use playerScore[0]
    # if playerScore.length = 2, then...
      # if playerScore[1] > 21, use playerScore[0]
      # else, use playerScore[1]

    # playerScore logic
    playerScore = (@get 'playerHand').scores()
    if playerScore.length is 1 then playerScore = playerScore[0]
    if playerScore.length is 2
      if playerScore[1] > 21 then playerScore = playerScore[0]
      else playerScore = playerScore[1]
    console.log(playerScore)

    # dealerScore logic
    dealerScore = (@get 'dealerHand').scores()
    if dealerScore.length is 1 then dealerScore = dealerScore[0]
    if dealerScore.length is 2
      if dealerScore[1] > 21 then dealerScore = dealerScore[0]
      else dealerScore = dealerScore[1]
    console.log(dealerScore)

    if playerScore > dealerScore
      @set 'winner', 'player'
    if playerScore < dealerScore
      @set 'winner', 'dealer'
    @trigger('displayWinner', this)









  #SAVE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  #good syntax
  # (@get 'playerHand').on 'dealerTurn',( -> console.log("received by app")), @
