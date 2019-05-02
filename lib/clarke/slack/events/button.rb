module Clarke
  module Slack
    module Events
      class Button < Slack::Events::Base
        include Clarke::Events::Button
        attr_accessor :action_value, :callback_id

        def initialize(response_url, sender_id, sender_name, timestamp, action_value, callback_id)
          @action_value = action_value
          @callback_id = callback_id

          super(response_url, sender_id, sender_name, timestamp)
        end
      end
    end
  end
end
