module SeatGeek
  module Taxonomies
    class Tree
      FILE_PATH = "/Users/johnmoon/Desktop/side_projects/seat_geek/lib/seat_geek/yaml/event_parent_id.yaml"
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

      attr_accessor :parent_ids, :taxonomies

      private

      def build_tree
        parent_ids.each do |parent_id|
          parent_object = taxonomies.detect { |taxonomy| taxonomy['id'] == parent_id }

          child_taxonomies = [parent_object]
          taxonomies.each do |taxonomy|
            child_taxonomies << taxonomy if taxonomy['parent_id'].to_s[0] == parent_id.to_s[0]
          end

          parent_object_name = parent_object['name'].to_sym
          finished_tree[parent_object_name] = tree_klass[parent_object_name].new(child_taxonomies: child_taxonomies,
                                                                                 file_path: FILE_PATH,
                                                                                 type: parent_object['name'])
        end
      end

      def tree_klass
        { sports: SeatGeek::Taxonomies::Sports, concert: SeatGeek::Taxonomies::Concert, theater: SeatGeek::Taxonomies::Theater }
      end

      def finished_tree
        @finished_tree ||= { sports: nil, concert: nil, theater: nil }
      end
    end
  end
end
