require 'spec_helper'

describe RMeetup::Client, 'trying to fetch an unknown type' do
  it 'should throw an error' do
    lambda {
      OpenCongressApi::Client.fetch(:clowns)
    }.should raise_error(OpenCongressApi::InvalidRequestTypeError)
  end
end

describe RMeetup::Client, 'fetching some people' do
  before do
    @topics_fetcher = mock(OpenCongressApi::Fetcher::People)
    @topics_fetcher.stub!(:fetch).and_return([])
    @type = :people
  end

  it 'should try to get a Topic Fetcher' do
    RMeetup::Fetcher.should_receive(:for).with(@type).and_return(@topics_fetcher)
    RMeetup::Client.fetch(@type,{})
  end
end
