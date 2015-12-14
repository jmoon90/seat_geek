require "seat_geek/version"

module SeatGeek
  SEATGEEK_BASE_URL = 'http://api.seatgeek.com/2/events'
  def self.find_events(base_url: nil, month_of_the_year: nil, state: nil, attendee_count: nil, event_type: nil)
    @base_url = base_url || SEATGEEK_BASE_URL
    @month_of_the_year = month_of_the_year
    @state = state
    @attendee_count = attendee_count
    @event_type = event_type

    url = base_url + build_query
    request = Typhoeus::Request.new(url,
      method: :get,
      headers: { Accept: "json" }
    ).run
  end

  private

  attr_accessor :month_of_the_year, :state, :attendee_count, :event_type, :base_url

  def self.build_query
    query = ""
    if month_of_the_year
      query = month_query(month_of_the_year)
    end
    if state
      query = query + location_query(state)
    end
    if attendee_count
      query = query + attendee_count_query(attendee_count)
    end
    if event_type
      query = query + event_type_query(event_type)
    end
    query
  end

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
