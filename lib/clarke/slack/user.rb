module Clarke
  module Slack
    class User
      attr_reader :id, :name, :response_url

      def initialize(id, name, response_url)
        @id = id
        @name = name
        @response_url = response_url
      end
    end
  end
end
