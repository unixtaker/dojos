require File.expand_path('../test_helper', __FILE__)

class TestPlayer < Test::Unit::TestCase
  
  def test_initialize
	player = Player.new("White: 2C 3H 4S 8C AH")
	assert_equal "White", player.name
	assert_equal 14, player.hand.high_card.value
  end

end

