require './test/test_helper'

class TestClarkeSlackParser < Test::Unit::TestCase
  test 'parse plain text message event into text command' do
    plain_text_request = {
      "token" => 'VrisbWJrBlmLzWt20ZQi4Dut',
      "team_id" => 'TDXN37ZB5',
      "team_domain" => 'celiaspace',
      "channel_id" => 'DDZ7EELTY',
      "channel_name" => 'directmessage',
      "user_id" => 'UDXN37ZRR',
      "user_name" => 'celia',
      "command" => '/jamy',
      "text" => 'send quiz#1 @user',
      "response_url" => 'https://hooks.slack.com/commands',
      "trigger_id" => '482985452290.473751271379.a4077a8103baad24d082bd3f0a7ffae4'
    }

    events = Clarke::Slack::Parser.parse_request(plain_text_request)
    assert_not_empty events

    message = events.first
    assert message.is_a?(Clarke::Slack::Events::TextCommand)
    assert_equal 'UDXN37ZRR', message.sender.id
    assert_equal 'celia', message.sender.name
    assert_equal 'send quiz#1 @user', message.text
    assert_equal '/jamy', message.command
  end

  test 'parse interactive message into button' do
    interactive_message_request = {
	    "type" => "block_actions",
	    "team" => {
		    "id" => "T0CAG",
		    "domain" => "acme-creamery"
	    },
	    "user" => {
		    "id" => "U0CA5",
		    "username" => "celia",
		    "name" => "Celia",
		    "team_id" => "T3MDE"
	    },
	    "api_app_id" => "A0CA5",
	    "token" => "Shh_its_a_seekrit",
	    "container" => {
		    "type" => "message",
		    "text" => "The contents of the original message where the action originated"
	    },
	    "trigger_id" => "12466734323.1395872398",
	    "response_url" => "https://www.postresponsestome.com/T123567/1509734234",
	    "actions" => [
		    {
			    "type" => "button",
			    "block_id" => "BLOCKID",
			    "action_id" => "ACTIONID",
			    "value" => "ACTIONVALUE",
			    "text" => {
				    "type" => "plain_text",
				    "text" => "Reply to review",
				    "emoji" => false
			    },
			    "action_ts" => "1558890702.480492"
		    }
	    ]
    }

    events = Clarke::Slack::Parser.parse_request(interactive_message_request)
    assert_not_empty events

    message = events.first
    assert message.is_a?(Clarke::Slack::Events::Button)
    assert_equal 'U0CA5', message.sender.id
    assert_equal 'celia', message.sender.name
    assert_equal 'ACTIONID', message.callback_id
    assert_equal 'ACTIONVALUE', message.action_value
  end
end
