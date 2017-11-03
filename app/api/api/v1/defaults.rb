module API
  module V1
    module Defaults
      extend ActiveSupport::Concern

      included do
        version 'v1'
        format :json

        rescue_from ActiveRecord::RecordNotFound do |e|
          error_response(message: e.message, status: 404)
        end
      end
    end
  end
end
