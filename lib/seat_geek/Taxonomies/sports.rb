module SeatGeek
  module Taxonomies
    class Sports
      def initialize(taxonomies:)
        @taxonomies = taxonomies
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

      def build_child_tree
        # parent_ids.each do |parent_id|
        parent_object = taxonomies.detect { |taxonomy| taxonomy['id'] == parent_id }

        child_taxonomies = [parent_object]
        taxonomies.each do |taxonomy|
          child_taxonomies << taxonomy if taxonomy['parent_id'] == parent_id
        end
        child_taxonomies
        # end
      end
    end
  end
end
