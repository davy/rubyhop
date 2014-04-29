require "minitest/autorun"
require "rubyhop"

class TestPlayer < MiniTest::Test

  def setup
    @player = Player.new
  end

  def test_initialization
    assert_equal 266, @player.x
    assert_equal 300, @player.y
    assert_equal true, @player.alive
    assert @player.image.filename.match 'rubyguy-rise.png'
  end

  def test_hop
    @player.hop
    @player.update
    assert_equal 266, @player.x
    assert_equal 292.75, @player.y
  end

  def test_gravity
    3.times do
      @player.update
    end
    assert @player.image.filename.match 'rubyguy-fall.png'
  end

  def test_die_bang
    @player.die!
    assert_equal false, @player.alive
    assert @player.image.filename.match 'rubyguy-dead.png'
  end

  def test_offscreen_eh
    assert_equal false, @player.offscreen?
    140.times do
      @player.update
    end
    assert_equal true, @player.offscreen?
  end
end

