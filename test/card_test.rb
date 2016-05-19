require "pry"
require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/card"
require_relative "../lib/guess"
require_relative "../lib/deck"
require_relative "../lib/round"

class CardTest < Minitest::Test

  #Make sure sure that the answer of the car is coming up correctly!
  def test_card_has_question_and_answer
      card = Card.new("What is the capital of Alaska?", "Juneau")
      assert_equal "Juneau", card.answer
  end

  #Return feedback on whether guess is correct!
  def test_recognize_user_guess_correct
      card  = Card.new("What is the capital of Alaska?", "Juneau")
      guess = Guess.new("Juneau", card)
      assert_equal "Correct", guess.feedback
  end

  #Return feedback on whether guess is wrong!
  def test_recognize_user_guess_wrong
      card  = Card.new("Which planet is closest to the sun?", "Mercury")
      guess = Guess.new("Saturn", card)
      assert_equal "Wrong", guess.feedback
  end

end
