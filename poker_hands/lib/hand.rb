class PokerSet
  HIGH_CARD = 0x00
  ONE_PAIR = 0x01
  TWO_PAIR = 0x02
  THREE_OF_A_KIND = 0x04
  STRAIGHT = 0x08
  FLUSH = 0x10
  FULL_HOUSE = 0x20
  FOUR_OF_A_KIND = 0x40
  STRAIGHT_FLUSH = 0x80
end

class Hand
  attr_reader :cards
  
  def initialize(cards)
    @cards = cards.split(" ").map {|c| Card.new(c)}
  end
  
  def card_count
    @cards.count  
  end
  
  def high_card
    @cards.sort_by(&:value).last
  end
  
  def has_pair?
    set_of?(2) 
  end
  
  def has_three_of_a_kind?
    set_of?(3)
  end
  
  def has_full_house?
    set_of?(2) && set_of?(3)
  end
 
  def has_flush?
    suit_check = @cards.first.suit
    @cards.each do |c|
	if c.suit != suit_check
		return false
	end
    end
  end

  def has_straight?
    start_check = 0
    @cards.sort_by(&:value).each do |c| 
      if start_check == 0 
        start_check = c.value
      else
        if c.value - 1 != start_check 
		return false
	end
      end
    start_check = c.value
    
    end
  end

  def has_four_of_a_kind?
    set_of?(4)
  end

  def has_straight_flush?
     has_straight? && has_flush?
  end
  
  private
  
  def sequence_of(continuous)
    
  end
  
  def set_of?(count)
    same_card_set.values.select{|v| v == count}.any?
  end
  
  
  def same_card_set
    card_values={}
    @cards.each do |c| 
      card_values[c.value] ||= 0
      card_values[c.value] +=1
    end
    card_values
    
  end
  
end
