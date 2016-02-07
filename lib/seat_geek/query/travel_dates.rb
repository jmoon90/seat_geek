module SeatGeek
  module Query
    class TravelDates
      def initialize(travel_dates)
        @arrive = travel_dates.fetch(:arrive) { return }
        @depart = travel_dates.fetch(:depart) { return }
      end

      def query
        "&datetime_utc.gte=#{@arrive}&datetime_utc.lte=#{@depart}"
      end
    end
  end
end
