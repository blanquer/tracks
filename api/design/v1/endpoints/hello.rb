module Endpoints
  module V1
    class Hello
      include Praxis::ResourceDefinition
      version '1'
      
      action :say do
        routing { get '' }
      end
    end
  end
end