# require "seat_geek/build_query"
# require 'typhoeus'
# require 'oj'

module SeatGeek
  class Taxonomy
    PUBLIC_API_URL = 'http://api.seatgeek.com/2/taxonomies'
    def initialize()
    end

    def all
      @base_url = PUBLIC_API_URL
      parse_response(typhoeus_request.body)
    end

    def professional_sports
      professional = []
      profSports = [2,6,9,15,19,33,37]
      result = SeatGeek::Taxonomy.new.all

      profSports.each do |x|
        professional << result[x]
      end

      professional
    end

    def concerts
      #TODO finish code
    end

    def minor_sports
      #TODO finish code
    end

    private

    attr_accessor :base_url

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

    def options
      {
        base_url: base_url,
        # month_of_the_year: month_of_the_year,
        # state: state,
        # attendee_count: attendee_count,
        # event_type: event_type,
      }
    end
  end
end
