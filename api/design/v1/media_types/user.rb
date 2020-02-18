# frozen_string_literal: true

module V1
  module MediaTypes
    class User < Praxis::MediaType

      domain_model 'V1::Resources::User'

      description ''

      attributes do
        attribute :id, Integer
        attribute :first_name, String, description: 'First name'
        attribute :last_name, String, description: 'Last Name'
        attribute :is_admin, Attributor::Boolean
        attribute :projects, Attributor::Collection.of(MediaTypes::Project)
      end

      view :default do
        attribute :id
        attribute :first_name
        attribute :last_name
      end
    end
  end
end
