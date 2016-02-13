module SeatGeek
  module Query
    class TravelDates
      def initialize(travel_dates)
        @arrive = travel_dates.fetch(:arrive) { return }
        @depart = travel_dates.fetch(:depart) { return }
        @datetime_type = travel_dates.fetch(:datetime_type { 'local' }
      end

      def query
        "&datetime_#{@datetime_type}.gte=#{@arrive}&datetime_#{@datetime_type}.lte=#{@depart}"
      end
    end
  end
end
