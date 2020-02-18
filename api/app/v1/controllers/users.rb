module V1
  module Controllers
    class Users
      include Praxis::Controller

      include Praxis::Extensions::Rendering
      include Praxis::Extensions::MapperSelectors
      include Praxis::Extensions::AttributeFiltering

      implements V1::Endpoints::Users

      before :action do |controller, _callee|
        controller.set_selectors
      end

      def index(**args)
        objs = build_query(User).all

        display objs
      end
    end
  end
end