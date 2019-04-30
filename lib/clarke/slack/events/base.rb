module Clarke
  module Slack
    module Events
      class Base
        attr_accessor :sender, :timestamp

        def initialize(response_url, sender_id, sender_name, timestamp)
          @sender = Clarke::Slack::User.new(sender_id, sender_name, response_url)
          @timestamp = timestamp
        end
      end
    end
  end
end
