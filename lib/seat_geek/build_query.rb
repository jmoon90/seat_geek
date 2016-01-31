module SeatGeek
  class BuildQuery
    def self.build(options, base_url)
      query = ""
      if !base_url.match(/\?/)
        query = "?"
      end
      if options[:travel_dates]
        query = query + travel_dates_query(options[:travel_dates])
      end
      if options[:state]
        query = query + location_query(options[:state])
      end
      if options[:attendee_count]
        query = query + attendee_count_query(options[:attendee_count])
      end
      if options[:event_type]
        query = query + taxonomy_query(options[:event_type])
      end
      if options[:taxonomies]
        query = query + taxonomies
      end
      base_url + query
    end

    private

    # Events in travel date
    # $ curl 'http://api.seatgeek.com/2/events?datetime_utc.gte=2012-04-01&datetime_utc.lte=2012-04-30'
    def self.travel_dates_query(travel_dates)
      "&datetime_utc.gte=#{travel_dates[:arrive]}&datetime_utc.lte=#{travel_dates[:depart]}"
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
    def self.taxonomy_query(type)
      "&taxonomies.name=#{type}"
    end

  end
end
