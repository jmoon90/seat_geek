require 'typhoeus'
require 'oj'

require "seat_geek/version"
require "seat_geek/build_query"
require "seat_geek/taxonomy"

module SeatGeek
  extend self
  PUBLIC_API_URL = 'http://api.seatgeek.com/2/'

  def self.get_events(options)
    @options = options
    @base_url = PUBLIC_API_URL + 'events?'
    if options[:seat_geek_partner_id]
      @base_url =+ "aid=#{options[:seat_geek_partner_id]}"
    end

    parse_response(typhoeus_request.body)
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
      method: :get,
      headers: { Accept: "json" }
    ).run
  end

  def parse_response(json_string)
    Oj.load(json_string)
  end
end
