require "pry"
require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/card"
require_relative "../lib/guess"
require_relative "../lib/deck"
require_relative "../lib/round"
require_relative "../lib/cardgenerator"

class CardGeneratorTest < Minitest::Test

def test_create_cards
  filename = "./lib/cards.txt"
  cards = CardGenerator.new(filename).cards
  binding.pry
  assert_equal Array, cards.class
end

end
