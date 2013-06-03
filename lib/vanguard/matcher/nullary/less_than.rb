module Vanguard
  class Matcher
    class Nullary

      # Less than matcher
      class LessThan < self
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
          value < self.value
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
        # @return [undefined]
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
