require 'uri'
require 'net/http'
require 'json'

module OpenCongressApi
  module Fetcher
      def initialize(error_message, request_url)
        super "OpenCongress API Error: #{error_message}"
      end
    end

    class NoResponseError < StandardError
      def initialize
        super "No response was returned from OpenCongress"
      end
    end

    class Base
      def initialize
        @type = nil
      end

      # Fetch and parse a response
      # based on a set of options
      # Override this method to ensure
      # necessary options are passed
      # for the request
      def fetch(options = {})
        url = build_url(options)
        puts "Getting #{url}"

        json = get_response(url)

        if self.is_json?
          data = JSON.parse(json)
        else
          data = XmlSimple.xml_in(json)
        end

        # TODO: Raise hell if there is a problem

        collection = OpenCongressApi::Collection.build(json_result(data))
        collection.map!{|result| format_result(result)}
      end

      protected

        def format_result(result)
          result
        end

        def json_result(json)
          json
        end

        def build_url(options)
          options = encode_options(options)
          base_url + params_for(options)
        end

        def base_url
          "http://api.opencongress.org/#{@type}"
        end

        def params_for(options)
          params = (self.is_json?) ? ["json=true"] : []
          options.each do |key, value|
            params << "#{key}=#{value}"
          end
          "?#{params.join("&")}"
        end

        def encode_options(options)
          options.each do |key, value|
            options[key] = URI.encode(value.to_s)
          end
        end

        def get_response(url)
          Net::HTTP.get_response(URI.parse(url)).body || raise(NoResponseError.new)
        end

        def is_json?
          true
        end
    end
end
