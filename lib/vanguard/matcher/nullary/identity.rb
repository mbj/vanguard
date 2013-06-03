module Vanguard
  class Matcher
    class Nullary 
      # Equality matcher
      class Identity < self
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
          value.equal?(self.value)
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

        TRUE  = Identity.new(true)
        FALSE = Identity.new(false)
        NIL   = Identity.new(nil)
      end
    end
  end
end
