
Praxis::Application.instance.layout do
 map :initializers, 'config/initializers/**/*'
 map :lib, 'lib/**/*'
 map :design, 'design/' do
   map :api, 'api.rb'
   map :media_types, '**/media_types/**/*'
   map :resources, '**/endpoints/**/*'
 end
 map :app, 'app/' do
   map :models, 'models/**/*'
   map :controllers, '**/controllers/**/*'
   map :responses, '**/responses/**/*'
 end
end

