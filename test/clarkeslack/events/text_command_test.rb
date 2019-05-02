require './test/test_helper'

module Clarke
  module Slack
    module Events
      class TextCommandTest < Test::Unit::TestCase
        test 'should include modules' do
          message = Clarke::Slack::Events::TextCommand.new(nil, nil, nil, nil, nil, nil)
          assert message.class.include?(Clarke::Events::TextMessage)
        end

        test 'should not raise errors' do
          message = Clarke::Slack::Events::TextCommand.new(:response_url, :sender_id, :sender_name, :ts, :command, :text)
          assert_nothing_raised do
            message.sender
          end
        end
      end
    end
  end
end
