module SeatGeek
  module Taxonomies
    class Concert < ChildTree
      def initialize(child_taxonomies:)
        @taxonomies = child_taxonomies
      end

      def all
        taxonomies
      end

      def music_festival
        @parent_id = '2010000'
        build_tree
      end

      attr_accessor :taxonomies, :parent_id
    end
  end
end
