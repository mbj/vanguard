module Vanguard
  # Instance level mixins
  module InstanceMethods
    include Adamantium

    # Return validated resource
    #
    # @return [Object]
    #
    # @api private
    #
    attr_reader :resource

    # Return violation set
    #
    # @return [ViolationSet]
    #
    # @api private
    #
    def result
      self.class.validator.evaluate(resource)
    end
    memoize :result

    # Test if validator is valid
    #
    # @return [true]
    #   if valid
    #
    # @return [false]
    #   otherwise
    #
    # @api private
    #
    def valid?
      result.valid?
    end

    # Return violations on attribute name
    #
    # @param [Symbol] attribute_name
    #
    # @return [Enumerable<Violation>]
    #
    # @api private
    #
    def on(attribute_name)
      result.on(attribute_name)
    end

    # Return violations
    #
    # @return [Enumerable<Violation>]
    #
    # @api private
    #
    def violations
      result.violations
    end

  private

    # Initialize resource
    #
    # @param [Object] resource
    #
    # @return [undefined]
    #
    # @api private
    #
    def initialize(resource)
      @resource = resource
    end

  end
end
