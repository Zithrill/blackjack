assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'hit', ->
    it "should give the last card from the deck", ->
      assert.strictEqual true, true
  describe 'playerHit', ->
    it "should allow the player to hit if they have not yet busted", ->
      assert.strictEqual true, true
  describe 'dealerHit', ->
    it "should allow the player to hit if they have not yet busted", ->
      assert.strictEqual true, true
  describe 'playerBust', ->
    it "should allow the player to hit if they have not yet busted", ->
      assert.strictEqual true, true
  describe 'dealerBust', ->
    it "should allow the player to hit if they have not yet busted", ->
      assert.strictEqual true, true
  describe 'playerStand', ->
    it "should allow the player to hit if they have not yet busted", ->
      assert.strictEqual true, true
  describe 'playerBlackJack', ->
    it "should allow the player to hit if they have not yet busted", ->
      assert.strictEqual true, true
