module Vanguard
  # Validator compsed from many rules
  class Validator
    include Adamantium, Enumerable

    # Run validator on resource
    #
    # @param [Resource] resource
    #
    # @return [Result]
    #
    # @api private
    #
    def call(resource)
      Result.new(self, resource)
    end

    # Build validator
    #
    # @return [Validator]
    #
    # @api private
    #
    def self.build(&block)
      Builder.new(&block).validator
    end

    # Return rules set with rule added
    #
    # @param [Rule] rule
    #
    # @return [Validator]
    #
    # @api private
    #
    def add(rule)
      self.class.new(rules.dup << rule)
    end

    # Return rules on attribute name
    #
    # @param [Symbol] attribute_name
    #
    # @return [Enumerable<Rule>]
    #
    # @api private
    #
    def on(attribute_name)
      rules.select { |rule| rule.attribute_name == attribute_name }
    end

    # Return rules
    #
    # @return [Set<Rule>]
    #
    # @api private
    #
    attr_reader :rules

    # Enumerate rules
    #
    # @return [self]
    #   if block given
    #
    # @return [Enumerator]
    #   otherwise
    #
    # @api private
    #
    def each
      return to_enum unless block_given?

      rules.each { |rule| yield rule }

      self
    end

  private

    # Initialize object
    #
    # @param [Enumerable<Rule>] rules
    #
    # @return [undefined]
    #
    # @api private
    #
    def initialize(rules)
      @rules = rules.to_set
    end

    Vanguard.singleton_constant(self, :EMPTY) do

      # Return rule set with added rule
      #
      # @param [Rule] rule
      #
      # @api private
      #
      def add(rule)
        Validator.new([rule])
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
  end

end
