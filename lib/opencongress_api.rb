require 'net/http'
require 'date'
require 'rubygems'
require 'json'
require 'xmlsimple'
require 'opencongress_api/type'
require 'opencongress_api/collection'
require "opencongress_api/fetcher"
require "opencongress_api/version"

module OpenCongressApi
    # Errors
    class InvalidRequestTypeError < StandardError
        def initialize(type)
            super "Fetch type '#{type}' is not valid."
        end
    end

    class Client
        FETCH_TYPES = [:people, :hot_bills, :most_blogged_bills,
                      :bills_in_the_news, :most_commented_bills,
                      :most_tracked_bills, :most_supported_bills,
                      :most_opposed_bills]
        def self.fetch(type, options = {})
            check_configuration!

            options = default_options.merge(options)
            if FETCH_TYPES.include? type.to_sym
                fetcher = OpenCongressApi::Fetcher.for(type)
                return fetcher.fetch(options)
            else
                raise InvalidRequestTypeError.new(type)
            end
        end

        protected
        def self.default_options
            {
            }
        end

        def self.check_configuration!

        end
    end
end
