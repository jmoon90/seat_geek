module SeatGeek
  module Taxonomies
    class Theater < ChildTree
      def initialize(child_taxonomies:)
        @taxonomies = child_taxonomies
      end

      def all
        taxonomies
      end

      def classical
        @parent_id = 3010000
        build_child_tree
      end

      attr_accessor :taxonomies, :parent_id
    end
  end
end
