require './test/test_helper'

module Clarke
  module Slack
    module Events
      class ButtonTest < Test::Unit::TestCase
        test 'should include modules' do
          message = Clarke::Slack::Events::Button.new(nil, nil, nil, nil, nil, nil)
          assert message.class.include?(Clarke::Events::Button)
        end

        test 'should not raise errors' do
          message = Clarke::Slack::Events::Button.new(:response_url, :sender_id, :sender_name, :ts, :action_value, :callback_id)
          assert_nothing_raised do
            message.sender
          end
        end
      end
    end
  end
end
