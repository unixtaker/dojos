class Player
  attr_reader :name
  attr_reader :hand
  attr_reader :handrank

  def initialize(data)
	  @name = data.split(':')[0]
	  @hand = Hand.new(data.split(':')[1])
	  @handrank = @hand.rank_hand_set
  end

end
