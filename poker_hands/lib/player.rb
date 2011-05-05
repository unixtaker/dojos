class Player
  attr_reader :name
  attr_reader :hand
  attr_reader :handrank
  attr_reader :winning_card
  

  def initialize(data)
	  @name = data.split(':')[0]
	  @hand = Hand.new(data.split(':')[1])
	  @handrank = @hand.rank_hand_set
	  
  end
  
  def set_winning_card(card)
    @winning_card = card
  end
  
  def get_friendly_pokerhand
     case 
     when @handrank == PokerSet::NONE
     "high card: " + @winning_card.friendly_name
     when @handrank == PokerSet::ONE_PAIR
     "pair"
     when @handrank == PokerSet::FLUSH
     "flush"
     end
  end

end
