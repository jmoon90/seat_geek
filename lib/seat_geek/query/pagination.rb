module SeatGeek
  module Query
    class Pagination
      def initialize(options)
        @per_page = options.fetch(:per_page) { 25 }
        @page = options.fetch(:page) { 1 }
      end

      def query
        "&per_page=#{@per_page}&page=#{@page}"
      end
    end
  end
end
