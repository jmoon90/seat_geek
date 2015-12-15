require "seat_geek/version"
require "seat_geek/build_query"
require 'byebug'
require 'typhoeus'
require 'oj'

module SeatGeek
  extend self

  def get_events(base_url: nil, month_of_the_year: nil, state: nil, attendee_count: nil, event_type: nil)
    @base_url = base_url || seatgeek_base_url
    @month_of_the_year = month_of_the_year
    @state = state
    @attendee_count = attendee_count
    @event_type = event_type

    parse_response(typhoeus_request.body)
  end

  def get_venues
    @base_url = seatgeek_taxonomies_url
    parse_response(typhoeus_request.body)
  end

  private

  attr_accessor :month_of_the_year, :state, :attendee_count, :event_type, :base_url

  def build_url
    BuildQuery.build(options)
  end

  def typhoeus_request
    request = Typhoeus::Request.new(build_url,
      method: :get,
      headers: { Accept: "json" }
    ).run
  end

  def parse_response(json_string)
    Oj.load(json_string)
  end

  def seatgeek_base_url
    'http://api.seatgeek.com/2/events'
  end

  def seatgeek_taxonomies_url
    'http://api.seatgeek.com/2/taxonomies'
  end

  def options
    {
      base_url: base_url,
      month_of_the_year: month_of_the_year,
      state: state,
      attendee_count: attendee_count,
      event_type: event_type,
    }
  end
end
