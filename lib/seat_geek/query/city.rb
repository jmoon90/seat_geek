module SeatGeek
  module Query
    class City
      def initialize(city)
        @city = city
      end

      def query
        "&venue.city=#{@city}"
      end
    end
  end
end
