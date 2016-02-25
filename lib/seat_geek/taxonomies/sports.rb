module SeatGeek
  module Taxonomies
    class Sports < ChildTree
      def initialize(child_taxonomies:)
        @taxonomies = child_taxonomies
      end

      def all
        taxonomies
      end

      def baseball
        @parent_id = 1010000
        build_tree
      end

      def basketball
        @parent_id = 1030000
        build_tree
      end

      def hockey
        @parent_id = 1040000
        build_tree
      end

      def football
       @parent_id = 1020000
        build_tree
      end

      def auto_racing
        @parent_id = 1060000
        build_tree
      end

      def golf
        @parent_id = 1070000
        build_tree
      end

      def fighting
        @parent_id = 1080000
        build_tree
      end

      def tennis
        @parent_id = 1090000
        build_tree
      end

      def animal_sports
        @parent_id = 1100000
        build_tree
      end

      def extreme_sports
        @parent_id = 1110000
        build_tree
      end

      def olympic_sports
        @parent_id = 1120000
        build_tree
      end

      private

      attr_accessor :parent_id, :taxonomies

    end
  end
end
