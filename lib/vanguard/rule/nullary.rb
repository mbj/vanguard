module Vanguard
  class Rule

    # Abstract base class for nullary resource rules
    class Nullary < self

      # Register dsl method
      #
      # @param [Symbol] name
      #
      # @return [self]
      #
      # @api private
      #
      def self.register(name)
        DSL.register(name, Proxy.new(builder, self))
        self
      end
      private_class_method :register

      # Return builder for nullary rule
      #
      # @return [Class:Builder]
      #
      # @api private
      #
      def self.builder
        self::Builder
      end

      # Return symbolic type of rule
      #
      # @return [Symbol]
      #
      # @api private
      #
      def type
        self.class::TYPE
      end

      # Proxy class to simplify builder registration
      class Proxy
        include Adamantium::Flat

        # Run builder with arguments
        #
        # @param [Enumerable<Object>] arguments
        #
        # @return [Enumerable<Rule>] 
        #
        # @api private
        #
        def run(*arguments)
          @builder.run(@klass, *arguments)
        end

      private

        # Initialize object
        #
        # @param [Class:Builder] builder
        # @param [Class:Rule] klass
        #
        # @return [undefined]
        #
        # @api private
        def initialize(builder, klass)
          @builder, @klass = builder, klass
        end
      end

      # Base class for nullary builders
      #
      # TODO: Remove this
      #
      class Builder < Builder::Nullary
      end
    end

  end
end
