require "minitest/autorun"
require "rubyhop"

class TestHoop < MiniTest::Test

  def setup
    @hoop = Hoop.new
  end

  def test_initialize
    assert_equal 0, @hoop.x
    assert_equal 0, @hoop.y
    assert_equal true, @hoop.active
  end

  def test_update
    @hoop.update 10
    assert_equal -10, @hoop.x
    assert_equal 0, @hoop.y
  end

end
