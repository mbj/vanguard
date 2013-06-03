module Vanguard
  class Matcher
    class Nullary

      # Matcher that matches primitive types
      class Primitive < self
        include Equalizer.new(:primitive)

        # Return primitive
        #
        # @return [Class] primitive
        #
        # @api private
        #
        attr_reader :primitive

        # Test if value is kind of primitive 
        #
        # @return [true]
        #   if value is kind of primitive
        #
        # @return [false]
        #   otherwise
        #
        # @api private
        #
        def matches?(value)
          value.kind_of?(primitive)
        end

      private

        # Initialize object
        #
        # @param [Class] primitive
        #
        # @return [undefined]
        #
        # @api private
        #
        def initialize(primitive)
          @primitive = primitive
        end
      end
    end
  end
end
