module Vanguard
  class Matcher
    class Binary
      # Boolean xor connector
      class XOR < self

        # Test if value matches left xor right
        #
        # @return [true]
        #
        # @return [false]
        #
        # @api private
        #
        def matches?(value)
          left_matches?(value) ^ right_matches?(value)
        end

      end
    end
  end
end
