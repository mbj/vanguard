module Vanguard
  class Matcher
    class Binary 
      # Boolean and connector
      class AND < self
        # Test if value matches left and right
        #
        # @return [true]
        #
        # @return [false]
        #
        # @api private
        #
        def matches?(value)
          left_matches?(value) && right_matches?(value)
        end
      end
    end
  end
end
