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

def test_store_cards_inside_deck
card_1 = Card.new("What is the capital of Alaska?", "Juneau")
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars")
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west")
deck = Deck.new([card_1, card_2, card_3])
assert [card_1, card_2, card_3], deck.cards
assert 3, deck.count
end

def test_deck_in_a_round
card_1 = Card.new("What is the capital of Alaska?", "Juneau")
card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
deck = Deck.new([card_1, card_2])
round = Round.new(deck)
assert_equal (deck), round.deck
end

def test_round_guesses
card_1 = Card.new("What is the capital of Alaska?", "Juneau")
card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
deck = Deck.new([card_1, card_2])
round = Round.new(deck)
assert_equal [], round.guesses
end

def test_current_card
card_1 = Card.new("What is the capital of Alaska?", "Juneau")
card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
deck = Deck.new([card_1, card_2])
round = Round.new(deck)
assert_equal "What is the capital of Alaska?", round.current_card.question
end

def test_record_guess
card_1 = Card.new("What is the capital of Alaska?", "Juneau")
card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
deck = Deck.new([card_1, card_2])
round = Round.new(deck)
assert_instance_of Guess, round.record_guess("Juneau")
assert_equal 1, round.guesses.count
end

def test_guess_count
card_1 = Card.new("What is the capital of Alaska?", "Juneau")
card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
deck = Deck.new([card_1, card_2])
round = Round.new(deck)
assert_instance_of Guess, round.record_guess("Juneau")
assert_equal 1, round.guesses.count
end

def test_guess_count
card_1 = Card.new("What is the capital of Alaska?", "Juneau")
card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
deck = Deck.new([card_1, card_2])
round = Round.new(deck)
assert_instance_of Guess, round.record_guess("Juneau")
assert_equal 1, round.guesses.count
assert_equal "Correct", round.guesses.first.feedback
end

def test_first_feedback
card_1 = Card.new("What is the capital of Alaska?", "Juneau")
card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
deck = Deck.new([card_1, card_2])
round = Round.new(deck)
assert_instance_of Guess, round.record_guess("Juneau")
assert_equal 1, round.guesses.count
assert_equal "Correct", round.guesses.first.feedback
end

def test_number_correct
card_1 = Card.new("What is the capital of Alaska?", "Juneau")
card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
deck = Deck.new([card_1, card_2])
round = Round.new(deck)
assert_instance_of Guess, round.record_guess("Juneau")
assert_equal 1, round.guesses.count
assert_equal "Correct", round.guesses.first.feedback
assert_equal 1, round.number_correct
end

end
