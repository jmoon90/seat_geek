module SeatGeek
  module Taxonomies
    class ChildTree
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

