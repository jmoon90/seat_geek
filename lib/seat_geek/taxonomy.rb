module SeatGeek
  class Taxonomy
    PUBLIC_API_URL = 'http://api.seatgeek.com/2/taxonomies'

    def all
      @base_url = PUBLIC_API_URL
      parse_response(typhoeus_request.body)
    end

    def professional_sports
      professional_sport_ids = [2, 6, 9, 15, 19, 33, 37, ]
      get_events(professional_sport_ids)
    end

    def performance
      concert_ids = [46, 47, 48, 49, 54, 55, 57, ]
      get_events(concert_ids)
    end

    def minor_league_sports
      minor_sport_ids = [4, 17, 13, ]
      get_events(minor_sport_ids)
    end

    private

    attr_accessor :base_url

    def get_events(event_ids)
      events = []
      taxonomies = SeatGeek::Taxonomy.new.all['taxonomies']

      event_ids.each do |x|
        events << taxonomies[x]
      end
      events
    end

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
