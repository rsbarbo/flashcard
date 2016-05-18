require "pry"
require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/card"
require_relative "../lib/guess"
require_relative "../lib/deck"
require_relative "../lib/round"

class CardTest < Minitest::Test

def test_card_has_question_and_answer
card = Card.new("What is the capital of Alaska?", "Juneau")
assert card.question, "What is the capital of Alaska?"
assert card.answer, "Juneau"
end

  def test_recognize_user_guess_correct
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_instance_of Card, guess.card
    assert_equal "Juneau", guess.response
    assert guess.correct?
    assert "Correct", guess.feedback
  end

  def test_recognize_user_guess_wrong
    card = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)
    assert_instance_of Card, guess.card
    assert_equal "Saturn", guess.response
    refute guess.correct?
    assert "Wrong", guess.feedback
  end

end
