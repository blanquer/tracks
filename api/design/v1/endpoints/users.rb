module V1
  module Endpoints
    class Users
      include Praxis::ResourceDefinition
      
      media_type V1::MediaTypes::User
      version '1'

      action :index do
        routing { get '' }
        response :ok, media_type: Praxis::Collection.of(MediaTypes::User)
      end
    end
  end
end