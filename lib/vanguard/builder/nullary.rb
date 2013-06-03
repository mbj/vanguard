module Vanguard
  class Builder
    # Abstract base class for nullary builders
    class Nullary < self
      include AbstractType

      OPTIONS          = [].freeze
      REQUIRED_OPTIONS = [].freeze

      # Return options
      #
      # @return [Hash]
      #
      # @api private
      #
      attr_reader :options

      # Return arguments
      #
      # @return [Class]
      #
      # @api private
      #
      attr_reader :klass

      # Return arguments
      #
      # @return [Enumerable<Object>] 
      #
      # @api private
      #
      attr_reader :arguments

      # Return rule for attribute name
      #
      # @param [Symbol] attribute_name
      #
      # @return [Rule]
      #
      # @api private
      #
      def rule(attribute_name)
        klass.new(attribute_name, matcher)
      end

      # Return matcher
      #
      # @return [Matcher]
      #
      # @api private
      #
      def matcher
        klass::MATCHER
      end

      # Return rules
      #
      # @api private
      #
      def rules
        arguments.map do |attribute_name|
          rule(attribute_name)
        end
      end
      memoize :rules

      # Return allowed options 
      #
      # @return [Enumerable<Symbol>]
      #
      # @api private
      #
      def allowed_options
        self.class::OPTIONS
      end

      # Return required options 
      #
      # @return [Enumerable<Symbol>]
      #
      # @api private
      #
      def required_options
        self.class::REQUIRED_OPTIONS 
      end

      # Run builder
      #
      # @return [Enumerable<Rule>]
      #
      # @api private
      #
      def self.run(*arguments)
        new(*arguments).rules
      end

    private

      # Initialize object
      #
      # @param [Class] klass
      # @param [Enumerable<Object>] arguments
      # @param [Hash] options
      #
      # @api private
      #
      def initialize(klass, arguments, options)
        @klass, @arguments, @options = klass, arguments, options
        assert_known_options
        assert_required_options
        assert_arguments
      end

      # Assert arguments are present
      #
      # TODO: Raise more specific expection
      #
      # @return [undefined]
      #
      # @raise [RuntimeError]
      #   if arguments are empty
      #
      # @return [undefined]
      #
      # @api private
      #
      def assert_arguments
        if arguments.empty?
          raise "#{klass} needs at least one attribute name"
        end
      end

      # Assert no unknown options are present
      #
      # TODO: Raise more specific exception
      #
      # @raise [RuntimeError]
      #   if unknown options are present
      #
      # @return [undefined]
      #
      # @api private
      #
      def assert_known_options
        unknown = present_keys - (allowed_options + required_options)

        unless unknown.empty?
          raise "Unknown options: #{unknown.inspect}"
        end
      end

      # Return present option keys
      #
      # @return [Enumerable<Object>]
      #
      # @api private
      #
      def present_keys
        options.keys
      end

      # Assert required options are present
      #
      # TODO: Raise more specific exception
      #
      # @raise [RuntimeException]
      #   if required options are not present
      #
      # @return [undefined]
      #
      # @api private
      #
      def assert_required_options
        missing = required_options - present_keys

        unless missing.empty?
          raise "Missing options: #{missing.inspect}"
        end
      end
    end
  end
end
