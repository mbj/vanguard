module Vanguard
  class Matcher
    class Binary
      # Boolean or connector
      class OR < self
        # Test if value matches left or right
        #
        # @return [true]
        #
        # @return [false]
        #
        # @api private
        #
        def matches?(value)
          left_matches?(value) || right_matches?(value)
        end
      end
    end
  end
end
