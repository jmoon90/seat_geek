module SeatGeek
  module Query
    class AttendeeCount
      def initialize(count)
        @count = count
      end

      def query
        "&listing_count.gt=#{@count}"
      end
    end
  end
end
