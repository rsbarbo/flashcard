require 'pry'
require_relative "card"

class CardGenerator

attr_reader :filename

def initialize(filename)
  @filename = filename
end

  def cards
    File.readlines("./lib/cards.txt").map do |line|
    per_and_resp = line.strip!.split(",")
      Card.new(per_and_resp[0], per_and_resp[1])
    end
  end
end
