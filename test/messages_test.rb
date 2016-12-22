require 'minitest/autorun'
require 'minitest/pride'
require './lib/messages'

class MessagesTest < Minitest::Test

  def test_opening_message
    m = Messages
    assert_equal "--",  m.opening_message.first(2)
  end
end