require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe OpenCongressApi::Fetcher::People, 'fetching some people' do
  before do
    @fetcher = OpenCongressApi::Fetcher::People.new
    @fetcher.extend(OpenCongressApi::FakeResponse::People)
  end

  it 'should return a collection of members' do
    @fetcher.fetch.each do |result|
      result.should be_kind_of(OpenCongressApi::Type::Person)
    end
  end
end
