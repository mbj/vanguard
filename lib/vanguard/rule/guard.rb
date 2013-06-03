module Vanguard
  class Rule
    class Guard < self
      # Return matcher
      #
      # @return [Matcher]
      #
      # @api private
      #
      attr_reader :matcher

      # Return operand
      #
      # @return [Rule]
      #
      # @api private
      #
      attr_reader :operand

      # Return attribute name
      #
      # @return [Symbol]
      #
      # @api private
      #
      def attribute_name
        operand.attribute_name
      end
      memoize :attribute_name

      # Return symbolic type
      #
      # @return [Symbol]
      #
      # @api private
      #
      def type
        operand.type
      end

    private

      # Intialize object
      #
      # @param [Matcher] matcher
      #
      # @param [Rule] operand
      #
      # @return [undefined]
      #
      # @api private
      #
      def initialize(matcher, operand)
        @matcher, @operand = matcher, operand
      end

      class Evaluator < Vanguard::Evaluator
        # Test if resource is valid
        #
        # @return [true]
        #   when guard matches and operand also
        #
        # @return [false]
        #   otherwise
        #
        # @api private
        #
        def valid?
          resource = self.resource

          unless matcher.matches?(resource)
            return true
          end

          operand.evaluate(resource).valid?
        end

      private

        # Return matcher
        #
        # @return [Matcher]
        #
        # @api private
        #
        def matcher
          rule.matcher
        end

        # Return operand
        #
        # @return [Rule]
        #
        # @api private
        #
        def operand
          rule.operand
        end
      end

    end
  end
end
