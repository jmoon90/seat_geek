module SeatGeek
  module Taxonomies
    class Sports < ChildTree
      def initialize(child_taxonomies:, file_path:, type:)
        @taxonomies = child_taxonomies
        @yaml_hash = YAML.load_file(file_path).fetch('event_parent_id').fetch(type)
      end

      def all
        taxonomies
      end

      def baseball
        @parent_id = @yaml_hash.fetch('baseball')
        build_tree
      end

      def basketball
        @parent_id = @yaml_hash.fetch('basketball')
        build_tree
      end

      def hockey
        @parent_id = @yaml_hash.fetch('hockey')
        build_tree
      end

      def football
        @parent_id = @yaml_hash.fetch('football')
        build_tree
      end

      def auto_racing
        @parent_id = @yaml_hash.fetch('auto_racing')
        build_tree
      end

      def golf
        @parent_id = @yaml_hash.fetch('golf')
        build_tree
      end

      def fighting
        @parent_id = @yaml_hash.fetch('fighting')
        build_tree
      end

      def tennis
        @parent_id = @yaml_hash.fetch('tennis')
        build_tree
      end

      def animal_sports
        @parent_id = @yaml_hash.fetch('animal_sports')
        build_tree
      end

      def extreme_sports
        @parent_id = @yaml_hash.fetch('extreme_sports')
        build_tree
      end

      def olympic_sports
        @parent_id = @yaml_hash.fetch('olympic_sports')
        build_tree
      end

      private

      attr_accessor :parent_id, :taxonomies

    end
  end
end
