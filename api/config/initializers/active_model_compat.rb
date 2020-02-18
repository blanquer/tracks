# frozen_string_literal: true

require 'active_support/concern'

module Praxis
  module Mapper
    module ActiveModelCompat
      extend ActiveSupport::Concern

      included do
        attr_accessor :_resource
        @repository_name = :default
      end

      module ClassMethods

        def finalized?
          true
        end

        def associations
          orig = self.reflections.clone

          orig.each_with_object({}) do |(k, v), hash|
            # Assume an 'id' primary key if the system is initializing without AR connected
            # (or without the tables created). This probably means that it's a rake task initializing or so...
            pkey = \
              if v.klass.connected? && v.klass.table_exists?
                v.klass.primary_key
              else
                'id'
              end
            info = { model: v.klass, primary_key: pkey }
            info[:type] = \
              case v
              when ActiveRecord::Reflection::BelongsToReflection
                :many_to_one
              when ActiveRecord::Reflection::HasManyReflection, ActiveRecord::Reflection::HasOneReflection
                :one_to_many
              when ActiveRecord::Reflection::ThroughReflection
                :many_to_many
              else
                raise "Unknown association type: #{v.class.name} on #{v.klass.name} for #{v.name}"
              end

            if v.is_a?(ActiveRecord::Reflection::ThroughReflection)
              info[:through] = v.through_reflection.name
            end

            # TODO: add more keys for the association to make true praxis mapper functions happy
            hash[k.to_sym] = info
          end
        end

      end
    end
  end
end
