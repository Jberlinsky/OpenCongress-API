module OpenCongressApi
  module Fetcher
    class Bills < Base
      def initialize
        @type = :bills
      end

      def format_result(result)
        OpenCongressApi::Type::Bill.new(result)
      end

      def json_result(json)
        json['bill']
      end

      def is_json?
        false
      end
    end

    class HotBills < Bills
      def initialize
        @type = :hot_bills
      end
    end

    class MostBloggedBills < Bills
      def initialize
        @type = :most_blogged_bills_this_week
      end
    end

    class NewsworthyBills < Bills
      def initialize
        @type = :bills_in_the_news_this_week
      end
    end

    class MostCommentedBills < Bills
      def initialize
        @type = :most_commented_this_week
      end
    end

    class MostTrackedBills < Bills
      def initialize
        @type = :most_tracked_bills_this_week
      end
    end

    class MostSupportedBills
      def initialize
        @type = :most_supported_bills_this_week
      end
    end

    class MostOpposedBills
      def initialize
        @type = :most_opposed_bills_this_week
      end
    end
  end
end
