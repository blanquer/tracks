module Controllers
  module V1
    class Hello
      include Praxis::Controller

      implements Endpoints::V1::Hello

      def say
        'hi'
      end
    end
  end
end