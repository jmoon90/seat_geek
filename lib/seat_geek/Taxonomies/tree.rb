module SeatGeek
  module Taxonomies
    class Tree
      def initialize(parent_ids:, taxonomies:)
        @parent_ids = parent_ids
        @taxonomies = taxonomies
        build_tree
      end

      def all
        finished_tree
      end

      def sports
        finished_tree[:sports]
      end

      def concert
        finished_tree[:concert]
      end

      def theater
        finished_tree[:theater]
      end

      private

      attr_accessor :parent_ids, :taxonomies

      def build_tree
        parent_ids.each do |parent_id|
          parent_object = taxonomies.detect { |taxonomy| taxonomy['id'] == parent_id }

          sub_taxonomies = taxonomies.each do |taxonomy|
            taxonomy['parent_id'] == parent_id
          end

          if parent_object.fetch('name') == 'sports'
            klass = SeatGeek::Taxonomies::Sports
          elsif parent_object.fetch('name') == 'concert'
            klass = SeatGeek::Taxonomies::Concert
          elsif parent_object.fetch('name') == 'theater'
            klass = SeatGeek::Taxonomies::Theater
          end
          finished_tree[parent_object['name'].to_sym] = klass.new(parent_object: parent_object, sub_taxonomies: sub_taxonomies)
        end
      end

      def finished_tree
        @finished_tree ||= { sports: nil, concert: nil, theater: nil }
      end
    end
  end
end

