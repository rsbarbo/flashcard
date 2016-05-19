require_relative "card"
require_relative "guess"
require_relative "deck"

require 'pry'

class Round

attr_reader :guesses, :deck, :first_card

  def initialize(deck)
    @deck = deck
    @first_card = 0
    @guesses = []
    @return_value = 0
    @correct_answers = 0
    @total_cards = deck.cards.count
    @current_guess = 0
  end

  def current_card
  deck.cards[@first_card]
  end

  def record_guess(response)
    guess_1 = Guess.new(response,current_card)
    @guesses << guess_1
    if response == current_card.answer
      @correct_answers += 1
    end
    @first_card += 1
    guesses[@return_value]
  end

  def count
    guesses.count
  end

  def number_correct
      @correct_answers
  end

  def percent_correct
  100 / @guesses.count * @correct_answers
  end

  def start
  puts "Welcome! You're playing with #{@total_cards} cards."
  deck.cards.each do |card|
  puts "-------------------------------------------------"
  puts "This card number #{first_card + 1} out of #{@total_cards}"
  puts card.question
  response = gets.chomp
  record_guess(response)
  # binding.pry
  puts @guesses[@current_guess].feedback
  @current_guess +=1
  end


  p "***** GAME OVER *****"
  p "You had #{number_correct} correct guesses out of 4 for a score of #{percent_correct}%."
  end


end
