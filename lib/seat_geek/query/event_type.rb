module SeatGeek
  module Query
    class EventType
      def initialize(event_type)
        @event_type = event_type
      end

      def query
        "&taxonomies.name=#{@event_type}"
      end
    end
  end
end
