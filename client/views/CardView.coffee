class window.CardView extends Backbone.View

  className: 'card'

  tagName: 'image'

  template: _.template '<image src="./img/cards/<%= rankName %>-<%= suitName %>.png">'

  initialize: ->
    @model.on 'change', => @render
    @render()

  render: ->
    #currentModel = @model.attributes
    @$el.children().detach().end().html
    @$el.html @template @model.attributes
   # @$el.css({"background-image":"url(./img/cards/#{currentModel.rankName}-#{currentModel.suitName}.png)", 'background-size':"cover"})
    @$el.addClass 'covered' unless @model.get 'revealed'
