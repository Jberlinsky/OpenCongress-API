$: << File.join(File.dirname(__FILE__), '..', 'lib')
require 'opencongress_api'

TEST_ROOT = File.dirname(__FILE__)

# Override the get_response portion of fetchers
# so that we don't have to go out and hit the internets
module OpenCongressApi::FakeResponse
  module Error
    protected
      def get_response(url)
        File.read(File.join(TEST_ROOT, 'responses', 'error.json'))
      end
  end

  module People
    protected
      def get_response(url)
        File.read(File.join(TEST_ROOT, 'responses', 'people.json'))
      end
  end
end
