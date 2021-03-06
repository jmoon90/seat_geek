require 'typhoeus'
require 'oj'

require "seat_geek/version"

require "seat_geek/build_query"
require "seat_geek/query/travel_dates"
require "seat_geek/query/attendee_count"
require "seat_geek/query/event_type"
require "seat_geek/query/state"
require "seat_geek/query/city"
require "seat_geek/query/partner_program"
require "seat_geek/query/pagination"

require "seat_geek/taxonomies/tree"
require "seat_geek/taxonomies/child_tree"
require "seat_geek/taxonomies/sports"
require "seat_geek/taxonomies/concert"
require "seat_geek/taxonomies/theater"


module SeatGeek
  SPORTS_ID = 1000000
  CONCERT_ID = 2000000
  THEATRE_ID = 3000000

  extend self
  PUBLIC_API_URL = 'https://api.seatgeek.com/2/'

  def self.get_events(options)
    partner_id = options.fetch(:seat_geek_partner_id) { 11781 }
    @options = options.merge(rid: partner_id)
    @base_url = PUBLIC_API_URL + 'events'

    parse_response(typhoeus_request.body)
  end

  def self.get_event(id:)
    url = "#{PUBLIC_API_URL}events/#{id}"
    request = Typhoeus::Request.new(url,
                                     method: :get,
                                    ).run
    parse_response(request.body)
  end

  def self.get_taxonomies
    @options = {}
    @base_url = 'https://api.seatgeek.com/2/taxonomies'
    taxonomies = parse_response(typhoeus_request.body)['taxonomies']

    SeatGeek::Taxonomies::Tree.new(parent_ids: [SPORTS_ID, CONCERT_ID, THEATRE_ID], taxonomies: taxonomies)
  end

  def self.states
    @state ||= [{:state_name=>"AL"}, {:state_name=>"MT"}, {:state_name=>"AK"}, {:state_name=>"NE"},
              {:state_name=>"AZ"}, {:state_name=>"NV"}, {:state_name=>"AR"}, {:state_name=>"NH"},
              {:state_name=>"CA"}, {:state_name=>"NJ"}, {:state_name=>"CO"}, {:state_name=>"NM"},
              {:state_name=>"CT"}, {:state_name=>"NY"}, {:state_name=>"DE"}, {:state_name=>"NC"},
              {:state_name=>"FL"}, {:state_name=>"ND"}, {:state_name=>"GA"}, {:state_name=>"OH"},
              {:state_name=>"HI"}, {:state_name=>"OK"}, {:state_name=>"ID"}, {:state_name=>"OR"},
              {:state_name=>"IL"}, {:state_name=>"PA"}, {:state_name=>"IN"}, {:state_name=>"RI"},
              {:state_name=>"IA"}, {:state_name=>"SC"}, {:state_name=>"KS"}, {:state_name=>"SD"},
              {:state_name=>"KY"}, {:state_name=>"TN"}, {:state_name=>"LA"}, {:state_name=>"TX"},
              {:state_name=>"ME"}, {:state_name=>"UT"}, {:state_name=>"MD"}, {:state_name=>"VT"},
              {:state_name=>"MA"}, {:state_name=>"VA"}, {:state_name=>"MI"}, {:state_name=>"WA"},
              {:state_name=>"MN"}, {:state_name=>"WV"}, {:state_name=>"MS"}, {:state_name=>"WI"},
              {:state_name=>"MO"}, {:state_name=>"WY"}].sort_by { |x| x[:state_name] }
  end

  #TODO Need to think this through
  # not sure how to get recommendations or what we should get recommendations
  # for

  #Possible have a show page for the each events
  #Then add recommendations on the bottom for that event_id + zipcode

  #GET http://api.seatgeek.com/2/recommendations
  def self.get_recommendations()#client_key:)
    @base_url = PUBLIC_API_URL + '/recommendations?client_id=MzkzMjEyMnwxNDQ5MjgzMTQ1'
    parse_response(typhoeus_request.body)
  end

  private

  attr_accessor :options, :base_url

  # Instead of BuildQuery what if it's the Method name?
  # E.G Recommendations.build(options)
  # E.G Events.build(options)
  # This way each build could have their own custom settings
  def build_url
    BuildQuery.build(options, base_url)
  end

  def typhoeus_request
    Typhoeus::Request.new(build_url,
      method: :get
    ).run
  end

  def parse_response(json_string)
    Oj.load(json_string)
  end
end
