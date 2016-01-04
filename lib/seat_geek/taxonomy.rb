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
      concerts = []
      conert_ids = [2,6,9,15,19,33,37]
      result = SeatGeek::Taxonomy.new.all

      conert_ids.each do |x|
        concerts << result[x]
      end

      concerts
    end

    def minor_league_sports
      minor = []
      minorSports = [2,6,9,15,19,33,37]
      result = SeatGeek::Taxonomy.new.all

      minorSports.each do |x|
        minor << result[x]
      end

      minor
    end

    private

    attr_accessor :base_url

    def build_url
      BuildQuery.build({}, base_url)
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
  end
end
