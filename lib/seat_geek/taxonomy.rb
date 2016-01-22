module SeatGeek
  class Taxonomy
    PUBLIC_API_URL = 'https://api.seatgeek.com/2/taxonomies'
    SPORTS_ID = 1000000
    CONCERT_ID = 2000000
    THEATRE_ID = 3000000

    def initialize
      @base_url = PUBLIC_API_URL
      @taxonomies = parse_response(typhoeus_request.body)
    end

    def all
      taxonomies
    end

    def sports
      taxonomies_tree.sports
    end

    def concert
      taxonomies_tree.concert
    end

    def theater
      taxonomies_tree.theater
    end

    private

    attr_accessor :base_url, :taxonomies

    def taxonomies_tree
      @taxonomies_tree ||= SeatGeek::Taxonomies::Tree.new([SPORTS_ID, CONCERT_ID, THEATRE_ID], taxonomies['taxonomies'])
    end

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
