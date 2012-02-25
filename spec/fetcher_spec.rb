require 'spec_helper'

describe OpenCongressApi::Fetcher, 'being told to get a certain type of fetcher' do
  before do
    @fetcher_types = %w(people)
  end

  it 'should return the correct fetcher' do
    @fetcher_types.each do |type|
      fetcher = OpenCongressApi::Fetcher.for(type)
      fetcher.class.name.should eql("OpenCongressApi::Fetcher::#{type.capitalize}")
    end
  end

  it 'should return nil if asked for an invalid fetcher' do
    OpenCongressApi::Fetcher.for(:clowns).should be_nil
  end
end
