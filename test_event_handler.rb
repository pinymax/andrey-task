require "./event_handler.rb"
require "test/unit"

class TestEventHandler < Test::Unit::TestCase
  def test_simple
    assert_match "28.02.2018", EventDateHandler.new("31.01.2018").get_next_event_date
    assert_match "28.05.2018", EventDateHandler.new("26.04.2018").get_next_event_date
    assert_match "29.06.2018", EventDateHandler.new("31.05.2018").get_next_event_date
  end
end
