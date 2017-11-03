module API
  module V1
    module Entities
      class Tag < Grape::Entity
        expose :id, documentation: { type: 'Integer', desc: 'Tag unique id' }
        expose :content, documentation: { type: 'String', desc: 'Content of this tag' }
        expose :content_type, documentation: { type: 'String', desc: 'Type of this content' }
      end

      class Page < Grape::Entity
        expose :id, documentation: { type: 'Integer', desc: 'Page unique id' }
        expose :page_url, documentation: { type: 'String', desc: 'Page url' }
        expose :tags, using: API::V1::Entities::Tag, documentation: { type: 'Tag', desc: 'Tags for this page', is_array: true }
      end
    end
  end
end
