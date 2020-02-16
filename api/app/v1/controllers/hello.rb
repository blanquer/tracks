module Controllers
  module V1
    class Hello
      include Praxis::Controller

      implements Endpoints::V1::Hello

      def say
        'hi'
      end

      def list_things
        result = '[ '+ User.all.map(&:to_json).join(',') + ' ]'
        JSON.pretty_generate(JSON.parse(result))
      end
    end
  end
end