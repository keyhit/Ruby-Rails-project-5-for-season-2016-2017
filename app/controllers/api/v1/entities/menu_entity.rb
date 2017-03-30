module API
  module V1
    module Entities
      class MenuEntity < Grape::Entity
        format_with(:iso_timestamp) { |dt| dt.iso8601  }

        expose :id
        expose :name
        expose :restaurant_id

        with_options(format_with: :iso_timestamp) do
          expose :created_at
          expose :updated_at
        end
      end
    end
  end
end
