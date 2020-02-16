module Endpoints
  module V1
    class Hello
      include Praxis::ResourceDefinition
      version '1'

      action :say do
        routing { get '' }
      end
      action :list_things do
        routing { get '/list_things' }
      end
    end
  end
end