module Clarke
  module Slack
    module Events
      class TextCommand < Slack::Events::Base
        include Clarke::Events::TextMessage
        attr_accessor :command, :text

        def initialize(response_url, sender_id, sender_name, timestamp, command, text)
          @command = command
          @text = text

          super(response_url, sender_id, sender_name, timestamp)
        end
      end
    end
  end
end
