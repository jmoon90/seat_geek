module SeatGeek
  module Taxonomies
    class Theater < ChildTree
      def initialize(child_taxonomies:, file_path:, type:)
        @taxonomies = child_taxonomies
        @yaml_hash = YAML.load_file(file_path).fetch('event_parent_id').fetch(type)
      end

      def all
        taxonomies
      end

      def classical
        @parent_id = @yaml_hash.fetch('classical')
        build_child_tree
      end

      attr_accessor :taxonomies, :parent_id
    end
  end
end
