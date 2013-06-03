module Vanguard
  module DSL
    class Evaluator
      include Adamantium::Flat

      # Return klass
      #
      # @return [Class]
      #
      # @api private
      #
      attr_reader :klass

      # Return options hash
      #
      # @return [Hash]
      #
      # @api private
      #
      attr_reader :options

      # Return arguments array
      #
      # @return [Array]
      #
      # @api private
      #
      attr_reader :arguments

      # Return rules
      #
      # @return [Enumerable<Rule>]
      #
      # @api private
      #
      def rules
        klass.run(arguments, rule_options).map do |rule|
          connector.connect(rule)
        end
      end
      memoize :rules

    private

      # Initialize object 
      #
      # @param [Class] klass
      # @param [Enumerable<Object>] arguments
      #
      # @return [undefined]
      #
      # @api private
      #
      def initialize(klass, arguments)
        @klass     = klass
        @options   = arguments.last.kind_of?(Hash) ? arguments.pop : {}
        @arguments = arguments
        assert_no_conflict
      end

      # Return connector
      #
      # @return [Connector]
      #
      # @api private
      #
      def connector
        if_connector || unless_connector || Connector::NONE
      end
      memoize :connector

      class Connector
        include Adamantium::Flat, Equalizer.new(:klass, :left)

        # Return klass
        #
        # @return [Class]
        #
        # @api private
        #
        attr_reader :klass

        # Return left rule
        #
        # @return [Rule]
        #
        # @api private
        #
        attr_reader :left

        # Return connected rule
        #
        # @return [Rule] right
        #
        # @api private
        #
        def connect(right)
          @klass.new(left, right)
        end

        Vanguard.singleton_constant(self, :NONE) do

          # Return connector
          #
          # @param [Rule] right
          #
          # @return [Rule]
          #
          # @api private
          #
          def connect(right)
            right
          end

        private

          # Initialize object
          #
          # @return [undefined]
          #
          # @api private
          #
          def initialize; end

        end

      private

        # Initialize object
        #
        # @param [Class] klass
        # @param [Rule] left
        #
        # @return [undefined]
        #
        # @api private
        #
        def initialize(klass, left)
          @klass, @left = klass, left
        end
      end

      # Return if connector
      #
      # @return [Connector]
      #   if :if option is present
      #
      # @api private
      #
      def if_connector
        name = options.fetch(:if) { return }
        predicate = Matcher::Unary::Attribute.new(name, Matcher::Nullary::Identity::TRUE)
        Connector.new(Rule::Guard, predicate)
      end

      # Return unless connector
      #
      # @return [Connector]
      #   if :unless option is present
      #
      # @api private
      #
      def unless_connector
        name = options.fetch(:unless) { return }
        predicate = Matcher::Unary::Attribute.new(name, Matcher::Nullary::Identity::TRUE)
        predicate = Matcher::Unary::NOT.new(perdicate)
        Connector.new(Rule::Guard, rule)
      end

      # Assert no conflicting connectors are present
      #
      # @return [undefined]
      #
      # @api private
      #
      def assert_no_conflict
        if if_connector and unless_connector
          raise "Cannot specify both :if and :unless options"
        end
      end

      # Return rule options
      #
      # @return [Hash]
      #
      # @api private
      #
      def rule_options
        options = self.options.dup
        options.delete(:if)
        options.delete(:unless)
        options
      end
      memoize :rule_options
    end
  end
end
