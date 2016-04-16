module SeatGeek
  module Taxonomies
    class Theater < ChildTree
      def initialize(child_taxonomies:)
        @taxonomies = child_taxonomies
        file_path = "/Users/johnmoon/Desktop/side_projects/seat_geek/lib/seat_geek/yaml/event_parent_id.yaml"
        @units_hash = YAML.load_file(file_path).fetch('event_parent_id').fetch('theater')
      end

      def all
        taxonomies
      end

      def classical
        @parent_id = @units_hash.fetch('classical')
        build_child_tree
      end

      attr_accessor :taxonomies, :parent_id
    end
  end
end
