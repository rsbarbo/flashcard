require_relative "card"
require_relative "guess"
require_relative "round"

class Deck

attr_reader :count,
            :cards

def initialize(cards)
    @cards = cards
end

  def count
      @cards.count
  end

end
