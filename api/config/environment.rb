
require 'praxis/extensions/field_selection'
require 'praxis/extensions/attribute_filtering'
require 'praxis/plugins/praxis_mapper_plugin'


Praxis::Application.instance.bootloader.use Praxis::Plugins::PraxisMapperPlugin,
  config_data: {
    repositories: {},
    log_stats: 'skip',
  }

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
   map :resources, 'resources/**/*'
   map :controllers, '**/controllers/**/*'
   map :responses, '**/responses/**/*'
 end
end

