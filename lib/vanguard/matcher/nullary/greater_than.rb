module Vanguard
  class Matcher
    class Nullary
      # Greather than matcher
      class GreaterThan < self
        include Equalizer.new(:value)

        # Test if value is greater
        #
        # @param [Object] value
        #
        # @return [true]
        #
        # @return [false]
        #
        # @api private
        #
        def matches?(value)
          self.value < value
        end

        # Return value
        #
        # @return [Object]
        #
        # @api private
        #
        attr_reader :value

      private

        # Initialize object
        #
        # @param [Object] value
        #
        # @api private
        #
        def initialize(value)
          @value = value
        end

      end
    end
  end
end
