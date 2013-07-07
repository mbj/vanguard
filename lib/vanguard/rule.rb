# -*- encoding: utf-8 -*-

module Vanguard

  # Abstract base class for resource rules
  class Rule
    include AbstractType, Adamantium::Flat

    # Return violations for resource
    #
    # @param [Resource] resource
    #
    # @return [Enumerable<Violations>]
    #
    def violations(resource)
      evaluate(resource).violations
    end

    # Return evaluator for resource
    #
    # @param [Object] resource
    #   the target object to be validated
    #
    # @return [Evaluator]
    #
    # @api private
    #
    def evaluate(resource)
      evaluator.new(self, resource)
    end

    # Return evaluator
    #
    # @return [Class:Evaluator]
    #
    # @api private
    #
    def evaluator
      self.class::Evaluator
    end

  end # class Rule
end # module Vanguard
