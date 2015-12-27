require 'spec_helper'

describe SeatGeek::BuildQuery do
  describe '#build' do
    before(:each) do
      @base_url = 'api.seatgeek.com/2/events'
      @month_of_the_year = nil
      @state = nil
      @attendee_count = nil
      @event_type = nil
      @options = {base_url: @base_url,}
    end

    it 'return month_of_the_year url' do
      @options[:month_of_the_year] = '2016-01'
      result = SeatGeek::BuildQuery.build(@options)
      expect(result).to match('api.seatgeek.com/2/events?datetime_utc.gte=2016-01-01&datetime_utc.lte=2016-01-31')
    end

    it 'return state url' do
      @options[:state] = 'NY'
      result = SeatGeek::BuildQuery.build(@options)
      expect(result).to match('api.seatgeek.com/2/events&venue.state=NY')
    end

    it 'return attendee_count url' do
      @options[:attendee_count] = 2
      result = SeatGeek::BuildQuery.build(@options)
      expect(result).to match('api.seatgeek.com/2/events&listing_count.gt=2')
    end

    it 'return event_type url' do
      @options[:event_type] = 'nba'
      result = SeatGeek::BuildQuery.build(@options)
      expect(result).to match('api.seatgeek.com/2/events&taxonomies.name=nba')
    end

    it 'return base url' do
      result = SeatGeek::BuildQuery.build(@options)
      expect(result).to match(@base_url)
    end
  end
end
