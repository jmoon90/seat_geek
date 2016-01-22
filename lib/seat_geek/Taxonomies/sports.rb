module SeatGeek
  module Taxonomies
    class Sports
      def initialize(parent_object:, sub_taxonomies:)
        @parent_object = parent_object
        @sub_taxonomies = sub_taxonomies
      end

      attr_accessor :sub_taxonomies, :parent_object
    end
  end
end
