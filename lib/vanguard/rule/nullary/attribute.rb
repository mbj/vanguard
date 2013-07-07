module Vanguard
  class Rule
    # Abstract base class for nullary rules
    class Nullary

      class Attribute < self
        include Equalizer.new(:attribute_name, :matcher)

        # Return attribute name
        #
        # @return [Symbol]
        #
        # @api private
        #
        attr_reader :attribute_name

        # Return matcher
        #
        # @return [Matcher]
        #
        # @api private
        #
        attr_reader :matcher

        # Initialize object
        #
        # @param [Symbol] attribute_name
        #   the name of the attribute to validate.
        #
        # @return [undefined]
        #
        # @api private
        #
        def initialize(attribute_name, matcher)
          @attribute_name, @matcher = attribute_name, matcher
        end

        # Default evaluator
        class Evaluator < Vanguard::Evaluator
          # Test if value is valid
          #
          # @return [true]
          #   if value is matched by matcher
          #
          # @return [false]
          #   otherwise
          #
          # @api private
          #
          def valid?
            matcher.matches?(value)
          end
          memoize :valid?

          # Return matcher
          #
          # @return [Matcher]
          #
          # @api private
          #
          def matcher
            rule.matcher
          end

        end
      end
    end
  end
end
