require 'spec_helper'

describe SeatGeek::BuildQuery do
  describe '#build' do
    before(:each) do
      @options = {
        @travel_dates => nil,
        @state => nil,
        @attendee_count => nil,
        @event_type => nil,
      }
      @base_url = 'api.seatgeek.com/2/events'
    end

    it 'return travel_dates url' do
      @options[:travel_dates] = {arrive: '2016-03-15', depart: '2016-03-19'}
      result = SeatGeek::BuildQuery.build(@options, @base_url)
      expect(result).to match('api.seatgeek.com/2/events?&datetime_utc.gte=2016-03-15&datetime_utc.lte=2016-03-19')
    end

    it 'return state url' do
      @options[:state] = 'NY'
      result = SeatGeek::BuildQuery.build(@options, @base_url)
      expect(result).to match('api.seatgeek.com/2/events?&venue.state=NY')
    end

    it 'return city url' do
      @options[:city] = 'new-york-city'
      result = SeatGeek::BuildQuery.build(@options, @base_url)
      expect(result).to match('api.seatgeek.com/2/events?&venue.city=new-york-city')
    end

    it 'return attendee_count url' do
      @options[:attendee_count] = 2
      result = SeatGeek::BuildQuery.build(@options, @base_url)
      expect(result).to match('api.seatgeek.com/2/events?&listing_count.gt=2')
    end

    it 'return event_type url' do
      @options[:event_type] = 'nba'
      result = SeatGeek::BuildQuery.build(@options, @base_url)
      expect(result).to match('api.seatgeek.com/2/events?&taxonomies.name=nba')
    end

    it 'return base url' do
      result = SeatGeek::BuildQuery.build(@options, @base_url)
      expect(result).to match(@base_url)
    end

    it 'returns rid url' do
      @options[:rid] = 123
      result = SeatGeek::BuildQuery.build(@options, @base_url)
      expect(result).to match('api.seatgeek.com/2/events?&rid=123')
    end
  end
end
