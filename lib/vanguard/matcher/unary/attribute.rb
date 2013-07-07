module Vanguard
  class Matcher
    class Unary

      # Matcher that matches on attribute of value
      class Attribute < self

        # Return operand result for length of value
        #
        # @return [true]
        #   if operand returns false
        #
        # @return [false]
        #   otherwise
        #
        # @api private
        #
        def matches?(value)
          operand_matches?(value.public_send(attribute_name))
        end

        # Return attribute name
        #
        # @return [Symbol]
        #
        # @api private
        #
        attr_reader :attribute_name

      private

        # Initialize object
        #
        # @param [Matcher] operand
        # @param [Symbol] attribute_name
        #
        # @return [undefined]
        #
        # @api private
        #
        def initialize(attribute_name, operand)
          @attribute_name = attribute_name
          super(operand)
        end

      end
    end
  end
end
