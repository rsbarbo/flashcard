require "pry"
require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/card"
require_relative "../lib/guess"
require_relative "../lib/deck"
require_relative "../lib/round"

class CardTest < Minitest::Test

attr_reader :card_1, :card_2, :deck, :round

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    @card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    @deck = Deck.new([card_1, card_2])
    @round = Round.new(deck)
  end

def test_deck_in_a_round
assert_equal (deck), round.deck
end

def test_round_guesses
assert_equal [], round.guesses
end

def test_current_card
assert_equal "What is the capital of Alaska?", round.current_card.question
end

def test_record_guess
assert_instance_of Guess, round.record_guess("Juneau")
end

def test_guess_count
assert_instance_of Guess, round.record_guess("Juneau")
assert_equal 1, round.guesses.count
end

def test_first_feedback
assert_instance_of Guess, round.record_guess("Juneau")
assert_equal 1, round.guesses.count
assert_equal "Correct", round.guesses.first.feedback
end

def test_number_correct_1
assert_instance_of Guess, round.record_guess("Juneau")
assert_equal "Correct", round.guesses.first.feedback
assert_equal 1, round.number_correct
end

def test_current_card_2
round.record_guess("Juneau")
assert_equal card_2, round.current_card
end

def test_guess_record_2
round.record_guess("Juneau")
assert_instance_of Guess, round.record_guess("2")
end


def test_guess_count_2
round.record_guess("Juneau")
round.record_guess("2")
assert_equal 2, round.guesses.count
end

def test_round_guesses_last_feedback
round.record_guess("Juneau")
round.record_guess("2")
round.guesses.count
assert_equal "Wrong", round.guesses.last.feedback
end

def test_number_correct_2
round.record_guess("Juneau")
round.record_guess("2")
round.guesses.count
round.guesses.last.feedback
assert_equal 1, round.number_correct
end

def test_percent_correct
round.record_guess("Juneau")
round.record_guess("2")
round.guesses.count
round.guesses.last.feedback
round.number_correct
assert_equal 50, round.percent_correct
end

end
