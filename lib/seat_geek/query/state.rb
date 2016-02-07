module SeatGeek
  module Query
    class State
      def initialize(state)
        @state = state
      end

      def query
        "&venue.state=#{@state}"
      end
    end
  end
end
