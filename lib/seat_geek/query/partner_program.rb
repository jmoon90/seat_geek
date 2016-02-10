module SeatGeek
  module Query
    class PartnerProgram
      def initialize(rid)
        @rid = rid
      end

      def query
        "&rid=#{@rid}"
      end
    end
  end
end
