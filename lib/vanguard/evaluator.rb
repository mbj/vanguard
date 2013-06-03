module Vanguard
  # Abstract base class for rule evaluators
  class Evaluator
    include Adamantium::Flat, AbstractType, Equalizer.new(:rule, :resource, :valid?)

    # Return validated resource
    #
    # @return [Object]
    #
    # @api private
    #
    attr_reader :resource

    # Return rule
    #
    # @return [Rule]
    #
    # @api private
    #
    attr_reader :rule

    # Initialize object
    #
    # @param [Rule] rule
    # @param [Object] resource
    #
    # @return [undefined]
    #
    # @api private
    #
    def initialize(rule, resource)
      @rule, @resource = rule, resource
    end

    # Return value to be validated
    #
    # @return [Object]
    #
    # @api private
    #
    def value
      resource.public_send(rule.attribute_name)
    end
    memoize :value

    # Return violation
    # 
    # @return [Violation]
    #
    # @api private
    #
    def violation
      Violation.new(rule, resource)
    end
    memoize :violation

    # Return violations
    #
    # @return [Enumerable<Violation>]
    #
    # @api private
    #
    def violations
      unless valid?
        [violation]
      else
        []
      end
    end
    memoize :violations
  end
end
