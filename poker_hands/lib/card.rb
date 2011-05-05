class Card
  attr_reader :value
  attr_reader :suit
  
  VALUES = "23456789TJQKA"
  
  def initialize(face)
    @value = parse_card_value(face[0])
    @suit = face[1]
  end
  
  private
    def parse_card_value(value)
      raise StandardError, "Invalid Value" if VALUES.index(value).nil? 
      VALUES.index(value) +2
    end 
end
