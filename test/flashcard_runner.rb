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


#
# puts "Welcome! You're playing with 4 cards.
# -------------------------------------------------"
# p "This card number #{round.first_card + 1} out of 4"
# p card.question
# response = gets.chomp
# round.record_guess(response)
# puts round.guesses.first.feedback
#
# puts " "
#
# p "This card number #{round.first_card + 1} out of 4"
# p card.question
# response = gets.chomp
# round.record_guess(response)
# puts round.guesses[1].feedback
#
# puts " "
#
# p "This card number #{round.first_card + 1} out of 4"
# p card.question
# response = gets.chomp
# round.record_guess(response)
# p round.guesses[2].feedback
#
# puts " "
#
# p "This card number #{round.first_card + 1} out of 4"
# p card.question
# response = gets.chomp
# round.record_guess(response)
# puts round.guesses[3].feedback
#
# puts " "
#
# p "***** GAME OVER *****"
# p "You had #{round.number_correct} correct guesses out of 4 for a score of #{round.percent_correct}%."
