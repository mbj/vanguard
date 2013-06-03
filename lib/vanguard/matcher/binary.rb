module Vanguard
  class Matcher
    # Abstract base class for binary matcher
    class Binary < self
      include AbstractType, Equalizer.new(:left, :right)

      # Return left
      #
      # @return [Matcher]
      #
      # @api private
      #
      attr_reader :left

      # Return right
      #
      # @return [Matcher]
      #
      # @api private
      #
      attr_reader :right

    private

      # Initialize object
      #
      # @param [Matcher] left
      # @param [Matcher] right
      #
      # @return [undefined]
      #
      # @api private
      #
      def initialize(left, right)
        @left, @right = left, right
      end

      # Test if left matches
      #
      # @param [Object] value
      #
      # @api private
      #
      def left_matches?(value)
        left.matches?(value)
      end

      # Test if right matches
      #
      # @param [Object] value
      #
      # @api private
      #
      def right_matches?(value)
        right.matches?(value)
      end
    end
  end
end
