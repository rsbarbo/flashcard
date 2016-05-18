require "pry"
require_relative "../lib/card"
require_relative "../lib/guess"
require_relative "../lib/deck"
require_relative "../lib/round"

card_1 = Card.new("Question: What is 5 + 5?", "10")
card_2 = Card.new("Question: What is Rachel's favorite animal?", "Red Panda")
card_3 = Card.new("Question: What is Mike's middle name?", "nobody knows")
card_4 = Card.new("Question: What cardboard cutout lives at Turing?","Justin Bieber")
deck = Deck.new([card_1, card_2, card_3, card_4])
round = Round.new(deck)


puts "Welcome! You're playing with 4 cards.
-------------------------------------------------"
p "This card number #{round.first_card + 1} out of 4"
p card_1.question
response = gets.chomp
round.record_guess(response)
puts round.guesses.first.feedback

puts " "

p "This card number #{round.first_card + 1} out of 4"
p card_2.question
response = gets.chomp
round.record_guess(response)
puts round.guesses[1].feedback

puts " "

p "This card number #{round.first_card + 1} out of 4"
p card_3.question
response = gets.chomp
round.record_guess(response)
p round.guesses[2].feedback

puts " "

p "This card number #{round.first_card + 1} out of 4"
p card_4.question
response = gets.chomp
round.record_guess(response)
puts round.guesses[3].feedback

puts " "

p "***** GAME OVER *****"
p "You had #{round.number_correct} correct guesses out of 4 for a score of #{round.percent_correct}%."
