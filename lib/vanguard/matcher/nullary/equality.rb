module Vanguard
  class Matcher
    class Nullary 
      # Equality matcher
      class Equality < self
        include Equalizer.new(:value)

        # Return value
        #
        # @return [Object]
        #
        # @api private
        #
        attr_reader :value

        # Test if value for equality
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
          value == self.value
        end

      private

        # Intialize object
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
