require 'spec_helper'

describe 'get_event' do
  before(:each) do
    @result ||= SeatGeek.get_events(month_of_the_year: '2016-01', state: 'ny', attendee_count: '2', event_type: 'nba')['events']
  end

  it 'doesnt require params and contains 10 events' do
    expect(@result.count).to be_equal(10)
  end

  it 'should return new york as state' do
    expect(@result.first["venue"]["state"]).to match(/NY/)
  end

  it 'should return more than 2 listing_count' do
    expect(@result.first["stats"]["listing_count"]).to be >= 2
  end

  it 'should return january as month' do
    expect(@result.first["url"]).to match(/2016-01/)
  end

  it 'should return nba event' do
    expect(@result.first['type']).to match(/nba/)
  end

end
