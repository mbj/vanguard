#encoding: utf-8

module Vanguard
  class Rule
    class Nullary
      class Attribute

        # Rule for testing primitives
        class Primitive < self
          TYPE = :primitive

          # Builder for primitive rules
          class Builder < Nullary::Builder
            REQUIRED_OPTIONS = [:primitive].freeze

          private

            # Return matcher
            #
            # @return [MAtcher]
            #
            # @api private
            #
            def matcher
              Matcher::Nullary::Primitive.new(options.fetch(:primitive))
            end
            memoize :matcher
          end

          register :validates_primitive_of
        end
      end 
    end 
  end
end
