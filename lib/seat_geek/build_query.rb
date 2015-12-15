module SeatGeek
  class BuildQuery

    def self.build(options)
      query = ""
      if options[:month_of_the_year]
        query = month_query(options[:month_of_the_year])
      end
      if options[:state]
        query = '?' unless query.match(/\?/)
        query = query + location_query(options[:state])
      end
      if options[:attendee_count]
        query = '?' unless query.match(/\?/)
        query = query + attendee_count_query(options[:attendee_count])
      end
      if options[:event_type]
        query = '?' unless query.match(/\?/)
        query = query + event_type_query(options[:event_type])
      end
      options[:base_url] + query
    end

    private

    # Events in April 2012
    # $ curl 'http://api.seatgeek.com/2/events?datetime_utc.gte=2012-04-01&datetime_utc.lte=2012-04-30'
    def self.month_query(year_month)
      year, month = year_month.split('-')
      year = year.to_i
      month = month.to_i
      first_day_of_month = Date.civil(year, month, 1).strftime('%F')
      last_day_of_month = Date.civil(year, month, -1).strftime('%F')

      "?datetime_utc.gte=#{first_day_of_month}&datetime_utc.lte=#{last_day_of_month}"
    end

    # Events in NY state
    # $ curl 'http://api.seatgeek.com/2/events?venue.state=NY'
    def self.location_query(location)
      "&venue.state=#{location}"
    end

    # GET http://api.seatgeek.com/2/events?listing_count.gt=0
    def self.attendee_count_query(count)
      "&listing_count.gt=#{count}"
    end

    # Sporting Events
    # $ curl 'http://api.seatgeek.com/2/events?taxonomies.name=sports'
    def self.event_type_query(type)
      "&taxonomies.name=#{type}"
    end
  end
end
