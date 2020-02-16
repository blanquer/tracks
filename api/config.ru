# -p 8888

ENV['RACK_ENV'] ||= 'development'
Bundler.setup(:default, ENV['RACK_ENV'])
Bundler.require(:default, ENV['RACK_ENV'])


# class MyApi
#   include Praxis::Controller
#   include Praxis::ResourceDefinition

#   implements self

#   action :health_check do
#     routing { get '//health_check' }
#   end

#   action :hello do
#     routing { get '//hello' }
#   end

#   def health_check
#     'Good times'
#   end

#   def hello
#     'hi'
#   end
# end

run Praxis::Application.instance.setup
 