require "pry"
require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/card"
require_relative "../lib/guess"
require_relative "../lib/deck"
require_relative "../lib/round"
require_relative "../lib/cardgenerator"

class CardGeneratorTest < Minitest::Test

  #call the txt file, add to cards, make sure it is included in an array, and count
  def test_create_cards
      filename = "./lib/cards.txt"
      cards    = CardGenerator.new(filename).cards
      assert_equal Array, cards.class
      assert_equal 4,     cards.count
  end

end
