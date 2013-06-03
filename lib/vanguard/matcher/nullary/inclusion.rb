module Vanguard
  class Matcher
    class Nullary

      # Matcher that tests for inclusion of value
      class Inclusion < self
        include Equalizer.new(:accepted)

        # Return accepted values
        #
        # @return [#include?]
        #
        # @api private
        #
        attr_reader :accepted

        # Test if value is included
        #
        # @param [Object] value
        #
        # @return [true]
        #   if value is included
        #
        # @return [false]
        #   otherwise
        #
        # @api private
        #
        def matches?(value)
          accepted.include?(value)
        end

      private

        # Initialize object
        #
        # @param [#include?] accepted
        #
        # @return [undefined]
        #
        # @api private
        #
        def initialize(accepted)
          @accepted = accepted
        end

        # Build inclusion matcher
        #
        # @param [Object] value
        #
        # @return [Matcher]
        #
        # @api private
        #
        def self.build(value)
          if value.respond_to?(:include?)
            Inclusion.new(value)
          elsif value.respond_to?(:call)
            Proc.new(value)
          else
            raise "Cannot build inclusion matcher from: #{value.inspect}"
          end
        end
      end
    end
  end
end
