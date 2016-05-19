require "pry"
require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/card"
require_relative "../lib/guess"
require_relative "../lib/deck"
require_relative "../lib/round"

class CardTest < Minitest::Test

attr_reader :card_1,
            :card_2,
            :deck,
            :round

  def setup
      @card_1 = Card.new("What is the capital of Alaska?", "Juneau")
      @card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
      @deck   = Deck.new([card_1, card_2])
      @round  = Round.new(deck)
  end

    #Make sure deck is available for the round.
    def test_deck_in_a_round
        assert_equal (deck), round.deck
    end

    #Make sure guesses is being stored in an array.
    def test_round_guesses
        assert_equal [], round.guesses
    end

    #Return current card being called.
    def test_current_card
        assert_equal "What is the capital of Alaska?", round.current_card.question
    end

    #Record the first guess.
    def test_record_guess
        assert_instance_of Guess, round.record_guess("Juneau")
    end

    #Counts how many guesses were performed by the user.
    def test_guess_count
        assert_instance_of Guess, round.record_guess("Juneau")
        assert_equal 1, round.guesses.count
    end

    #Returns first card result - whether right or wrong.
    def test_first_feedback
        assert_instance_of Guess, round.record_guess("Juneau")
        assert_equal "Correct", round.guesses.first.feedback
    end

    #Count number of correct answers (1).
    def test_number_correct_1
        assert_instance_of Guess, round.record_guess("Juneau")
        assert_equal 1, round.number_correct
    end

    #Make sure it returns the second card (based on the guess recorded previously).
    def test_current_card_2
        round.record_guess("Juneau")
        assert_equal card_2, round.current_card
    end

    #Record second guess (based on the guess recorded previously)
    def test_record_guess_2
        round.record_guess("Juneau")
        assert_instance_of Guess, round.record_guess("2")
    end

    #Return how many guesses were performed in the round.
    def test_guess_count_2
        round.record_guess("Juneau")
        round.record_guess("2")
        assert_equal 2, round.guesses.count
    end

    #Return feedback from last guess based on the initial iteration (#1-4)
    def test_second_feedback
        round.record_guess("Juneau")
        round.record_guess("2")
        assert_equal "Wrong", round.guesses.last.feedback
    end

    #Return number of correct answers based on previous guesses.
    def test_number_correct_2
        round.record_guess("Juneau")
        round.record_guess("2")
        round.guesses.last.feedback
        assert_equal 1, round.number_correct
    end

    #Return the percentage of asnwers given correctly
    def test_percent_correct
        round.record_guess("Juneau")
        round.record_guess("2")
        round.number_correct
        assert_equal 50, round.percent_correct
    end

end
