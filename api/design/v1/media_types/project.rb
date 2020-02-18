# frozen_string_literal: true

module V1
  module MediaTypes
    class Project < Praxis::MediaType

      domain_model 'V1::Resources::Project'

      description ''

      attributes do
        attribute :id, Integer
        attribute :name, String
        attribute :description, String
      end

      view :default do
        attribute :id
      end
    end
  end
end

