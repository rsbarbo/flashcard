require_relative "guess"
require_relative "deck"
require_relative "round"

class Card

attr_reader :question,
            :answer

  def initialize (question, answer)
      @question = question
      @answer   = answer
  end

end
