# -*- encoding: utf-8 -*-

module Vanguard
  # Mixin for the Vanguard dsl
  module DSL

    REGISTRY = {}

    # Register macro
    #
    # @param [Symbol] name
    #
    # @param [Class] klass
    #
    # @return [self]
    #
    # @api private
    #
    def self.register(name, klass)
      REGISTRY[name] = klass
      self
    end

    # Hook called when method is missing
    #
    # @param [Symbol] method_name
    #
    # @return [self]
    #
    # @api private
    #
    def method_missing(method_name, *arguments)
      klass = REGISTRY.fetch(method_name) { super }

      Evaluator.new(klass, arguments).rules.each do |rule|
        add(rule)
      end

      self
    end

  end # module Macros
end # module Vanguard
