module Vanguard
  class Validator
    class Builder
      include Vanguard::DSL

      # Return rules
      #
      # @return [Enumerator<Rule>]
      #
      # @api private
      #
      attr_reader :rules

      # Initialize object
      #
      # @return [undefined]
      #
      # @api private
      #
      def initialize(&block)
        @rules = []
        if block_given?
          instance_exec(&block)
        end
      end

      # Add rule
      #
      # @param [Rule] rule
      #
      # @return [self]
      #
      # @api private
      #
      def add(rule)
        @rules << rule
        self
      end

      # Return validator
      #
      # @return [Validator]
      #
      # @api private
      #
      def validator
        Validator.new(rules)
      end

    end
  end
end
