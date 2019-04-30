module Clarke
  module Slack
    module Events
      class TextMessage < Slack::Events::Base
        include Clarke::Events::TextMessage
        attr_accessor :text

        def initialize(response_url, sender_id, sender_name, timestamp, text)
          @text = text

          super(response_url, sender_id, sender_name, timestamp)
        end
      end
    end
  end
end
