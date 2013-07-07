module Vanguard
  class Matcher

    # Abstract base class for unary matchers
    class Unary < self
      include AbstractType, Equalizer.new(:operand)

      # Return operand
      #
      # @return [Matcher]
      #
      # @api private
      #
      attr_reader :operand

    private

      # Test if operand matches
      #
      # @param [Object] value
      #
      # @return [true]
      #
      # @return [false]
      #
      # @api private
      #
      def operand_matches?(value)
        operand.matches?(value)
      end


      # Initialize object
      #
      # @param [Matcher] operand
      #
      # @api private
      #
      def initialize(operand)
        @operand = operand
      end

    end
  end
end
