module Clarke
  module Slack
    module Parser

      def self.parse_request(request_body)
        [parse_message(request_body)]
      end

      private

      def self.parse_message(incoming_message)
        if incoming_message.dig('command')
          message_text_command_formater(incoming_message)
        elsif incoming_message.dig('actions')
          message_action_formater(incoming_message)
        end
      end

      def self.message_text_command_formater(incoming_message)
        Clarke::Slack::Events::TextCommand.new(
          incoming_message.dig('response_url'),
          incoming_message.dig('user_id'),
          incoming_message.dig('user_name'),
          Time.now.to_i,
          incoming_message.dig('command'),
          incoming_message.dig('text')
        )
      end

      def self.message_action_formater(incoming_message)
        action = incoming_message.dig('actions').first
        user = incoming_message.dig('user')

        Clarke::Slack::Events::Button.new(
          incoming_message.dig('response_url'),
          user.dig('id'),
          user.dig('username'),
          Time.now.to_i,
          action.dig('value'),
          action.dig('action_id')
        )
      end
    end
  end
end
