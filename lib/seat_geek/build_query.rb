module SeatGeek
  class BuildQuery

    def self.query_klass
    @query_klass ||= {travel_dates: SeatGeek::Query::TravelDates,
                      attendee_count: SeatGeek::Query::AttendeeCount,
                      event_type: SeatGeek::Query::EventType,
                      state: SeatGeek::Query::State,
                      city: SeatGeek::Query::City,
                      rid: SeatGeek::Query::PartnerProgram,
                      pagination: SeatGeek::Query::Pagination
                     }
    end

    def self.build(options, base_url)
      options.reject! { |k, _v| k.nil? }

      query_params = options.map do |key, args|
        query_klass[key].new(args).query
      end.join('&')

      base_url + '?' + query_params
    end
  end
end
