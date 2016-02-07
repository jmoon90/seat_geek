module SeatGeek
  class BuildQuery
    def self.build(options, base_url)
      query = ""
      if !base_url.match(/\?/)
        query = "?"
      end

      # 'http://api.seatgeek.com/2/events?datetime_utc.gte=2012-04-01&datetime_utc.lte=2012-04-30'
      # 'http://api.seatgeek.com/2/events?venue.state=NY'
      # 'http://api.seatgeek.com/2/events?venue.city=new-york'
      #  http://api.seatgeek.com/2/events?listing_count.gt=0
      # 'http://api.seatgeek.com/2/events?taxonomies.name=sports'
      query_klass = {travel_dates: SeatGeek::Query::TravelDates,
                     attendee_count: SeatGeek::Query::AttendeeCount,
                     event_type: SeatGeek::Query::EventType,
                     state: SeatGeek::Query::State,
                     city: SeatGeek::Query::City,
                    }
      options.keys.each do |name|
        query = query + query_klass[name].new(options[name]).query if query_klass.keys.include?(name)
      end

      base_url + query
    end
  end
end
