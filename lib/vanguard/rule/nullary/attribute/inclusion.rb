#encoding: utf-8

module Vanguard
  class Rule
    class Nullary
      class Attribute

        # Rule that tests for inclusion
        class Inclusion < self
          TYPE = :inclusion

          # Builder for inclusion rule
          class Builder < Nullary::Builder
            REQUIRED_OPTIONS = [:within]

          private

            # Return matcher
            # 
            # @return [Matcher]
            # 
            # @api private
            #
            def matcher
              Matcher::Nullary::Inclusion.build(options.fetch(:within))
            end
            memoize :matcher
          end

          register :validates_inclusion_of


          # Rule that tests for acceptance
          class Acceptance < self
            TYPE = :acceptance
            DEFAULT_ACCEPTED_VALUES = [ '1', 1, 'true', true, 't' ].to_set.deep_freeze

            # Builder for acceptance rule
            class Builder < Nullary::Builder
              OPTIONS = [:accept]

            private

              # Return matcher
              #
              # @return [Matcher]
              #
              # @api private
              #
              def matcher
                Matcher::Nullary::Inclusion.new(options.fetch(:acccept) { DEFAULT_ACCEPTED_VALUES })
              end
              memoize :matcher
            end

            register :validates_acceptance_of
          end
        end 
      end 
    end 
  end
end
