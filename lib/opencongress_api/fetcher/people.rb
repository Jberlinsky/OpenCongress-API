module OpenCongressApi
  module Fetcher
    class People < Base
      def initialize
        @type = :people
      end

      def format_result(result)
        OpenCongressApi::Type::Person.new(result)
      end

      def json_result(json)
        json['people']
      end
    end
  end
end
