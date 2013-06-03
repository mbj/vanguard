# -*- encoding: utf-8 -*-

module Vanguard

  # Result of a resource validation
  class Result
    include Adamantium::Flat, Enumerable, Equalizer.new(:violations, :validator)

    # Test if result is valid
    #
    # @return [true]
    #   if no rules where violated
    #
    # @return [false]
    #   otherwise
    #
    # @api private
    #
    def valid?
      violations.empty?
    end

    # Return violations for resource
    #
    # @param [Resource] resource
    #
    # @api private
    #
    def violations
      validator.rules.each_with_object(Set.new) do |rule, violations|
        violations.merge(rule.violations(resource))
      end
    end
    memoize :violations

    # Return violations on attribute name
    #
    # @param [Symbol] attribute_name
    #
    # @return [Enumerable<Violation>]
    #
    # @api private
    #
    def on(attribute_name)
      violations.select { |violation| violation.attribute_name == attribute_name }
    end

    # Return resource
    #
    # @return [Resource]
    #
    # @api private
    #
    attr_reader :resource

    # Return validator
    #
    # @return [Validator]
    #
    # @api private
    #
    attr_reader :validator

  private

    # Initialize object
    #
    # @param [Validator] validator
    # @param [Resource] resource
    #
    # @return [undefined]
    #
    # @api private
    #
    def initialize(validator, resource)
      @validator, @resource = validator, resource
    end

  end # class ViolationSet
end # module Vanguard
