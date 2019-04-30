require "./test/test_helper"

class TestClarkeSlackEvents < Test::Unit::TestCase

  test "should include modules" do
    message = Clarke::Slack::Events::TextMessage.new(nil, nil, nil, nil, nil)
    assert message.class.include?(Clarke::Events::TextMessage)
  end

  test "should not raise errors" do
    message = Clarke::Slack::Events::TextMessage.new(:response_url, :sender_id, :sender_name, :ts, :text)
    assert_nothing_raised do
      message.sender
    end
  end
end
