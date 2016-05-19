require "pry"
require_relative "../lib/card"
require_relative "../lib/guess"
require_relative "../lib/deck"
require_relative "../lib/round"
require_relative "../lib/cardgenerator"

card = CardGenerator.new("cards.txt").cards
deck = Deck.new(card)
round = Round.new(deck)
round.start
