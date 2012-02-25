require "opencongress_api/fetcher/base"
require "opencongress_api/fetcher/people"
require "opencongress_api/fetcher/bills"

module OpenCongressApi
  module Fetcher
    class << self
      def for(type)
        return  case type.to_sym
                when :people
                  People.new
                when :bills
                  Bills.new
                when :hot_bills
                  HotBills.new
                when :most_blogged_bills
                  MostBloggedBills.new
                when :newsworthy_bills
                  NewsworthyBills.new
                when :most_commented_bills
                  MostCommentedBills.new
                when :most_tracked_bills
                  MostTrackedBills.new
                when :most_supported_bills
                  MostSupportedBills.new
                when :most_opposed_bills
                  MostOpposedBills.new
                end
      end
    end
  end
end
