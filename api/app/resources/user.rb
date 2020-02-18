# frozen_string_literal: true

module V1
  module Resources
    class User < Praxis::Mapper::Resource
      model ::User

      include Praxis::Extensions::QueryBuilder

      filters_mapping(
        'first_name': 'first_name',
        'last_name': 'last_name',
        'is_admin': 'is_admin',
      )

      property :first_name, dependencies: %i[first_name]
      property :last_name, dependencies: %i[last_name]
      property :is_admin, dependencies: %i[id_admin]
    end
  end
end
