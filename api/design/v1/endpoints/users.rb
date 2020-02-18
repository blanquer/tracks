module V1
  module Endpoints
    class Users
      include Praxis::ResourceDefinition
      
      media_type V1::MediaTypes::User
      version '1'

      action :index do
        routing { get '' }
        params do
          attribute :fields, Praxis::Types::FieldSelector.for(MediaTypes::User),
                  description: 'Fields with which to render the result.'
          attribute :view, Symbol, example: :default
        end

        response :ok, media_type: Praxis::Collection.of(MediaTypes::User)
      end
    end
  end
end