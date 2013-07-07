#encoding: utf-8

module Vanguard
  # Rule violation on resouce
  class Violation
    include Adamantium::Flat, Equalizer.new(:resource, :rule)

    # Return object validated in this violation
    #
    # @return [Object]
    #
    # @api private
    #
    attr_reader :resource

    # Rule which generated this Violation
    #
    # @return [Vanguard::Rule]
    #
    # @api private
    #
    attr_reader :rule

    # Name of the attribute which this Violation pertains to
    #
    # @return [Symbol]
    #   the name of the validated attribute associated with this violation
    #
    # @api private
    #
    def attribute_name
      rule.attribute_name
    end

    # Return symbolic type of rule
    #
    # @return [Symbol]
    #
    # @api private
    #
    def type
      rule.type
    end

    # Return violation info
    #
    # @return [Hash]
    #
    # @api private
    #
    def info
      rule.violation_info.merge(:value => @value)
    end
    memoize :info

    # Return Violation values
    #
    # @return [Object]
    #
    # @api private
    #
    def values
      rule.violation_values
    end

  private

    # Initialize object
    #
    # @param [Resource] resource
    #   the validated object
    #
    # @param [Rule] rule
    #   the rule that was violated
    #
    # @return [undefined]
    #
    # @api private
    #
    def initialize(rule, resource)
      @rule, @resource = rule, resource
    end
  end # class Violation
end # module Vanguard
