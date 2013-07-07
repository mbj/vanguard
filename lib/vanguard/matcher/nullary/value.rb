module Vanguard
  class Matcher
    class Nullary

      # Module for generating value matchers
      #
      # TODO: Move somehere else
      #
      module Value

        # Build value matcher
        #
        # @param [Object] value
        #
        # @return [Matcher]
        #
        # @api private
        #
        def self.build(value)
          case value
          when Range
            Inclusion.new(value)
          when Fixnum
            Equality.new(value)
          else
            raise "Cannot build value matcher from: #{value.inspect}"
          end
        end
      end
    end
  end
end
