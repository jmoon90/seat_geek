module SeatGeek
  module Taxonomies
    class Concert < ChildTree
      def initialize(child_taxonomies:)
        @taxonomies = child_taxonomies
        file_path = "/Users/johnmoon/Desktop/side_projects/seat_geek/lib/seat_geek/yaml/event_parent_id.yaml"
        @units_hash = YAML.load_file(file_path).fetch('event_parent_id').fetch('concert')
      end

      def all
        taxonomies
      end

      def music_festival
        @parent_id = @units_hash.fetch('music_festival')
        build_tree
      end

      attr_accessor :taxonomies, :parent_id
    end
  end
end
