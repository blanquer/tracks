module V1
  module Controllers
    class Users
      include Praxis::Controller

      include Praxis::Extensions::Rendering
      # include Praxis::Extensions::MapperSelectors
      # include Praxis::Extensions::AttributeFiltering

      implements V1::Endpoints::Users

      def index
        display User.all
      end
    end
  end
end