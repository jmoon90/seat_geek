module SeatGeek
  module Taxonomies
    class Concert
      def initialize(sub_taxonomies:)
        @taxonomies = sub_taxonomies
      end

      def all
        taxonomies
      end

      def music_festival
        @parent_id = '2010000'
        build_tree
      end

      attr_accessor :taxonomies, :parent_id

      private

      def build_child_tree
        parent_object = taxonomies.detect { |taxonomy| taxonomy['id'] == parent_id }

        child_taxonomies = [parent_object]
        taxonomies.each do |taxonomy|
          child_taxonomies << taxonomy if taxonomy['parent_id'] == parent_id
        end
        child_taxonomies
      end
    end
  end
end
