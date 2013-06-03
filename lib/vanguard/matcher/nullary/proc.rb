module Vanguard
  class Matcher
    class Nullary

      # A matcher that delegates to block
      class Proc < self
        include Equalizer.new(:block)
        
        # Return block
        #
        # @return [Proc]
        #
        # @api private
        #
        attr_reader :block
        
        # Test if value matches
        #
        # @return [true]
        #   if block returns non falsy value
        #
        # @return [false]
        #   otherwise
        #
        def matches?(input)
          !!@block.call(input)
        end

        # Initialize object
        #
        # @param [Proc] block
        #
        # @return [undefined]
        #
        # @api private
        #
        def initialize(block)
          @block = block
        end

      end
    end
  end
end
