# -*- encoding: utf-8 -*-

require 'date'
require 'backports'
require 'bigdecimal'
require 'bigdecimal/util'
require 'forwardable'
require 'adamantium'
require 'equalizer'
require 'abstract_type'
require 'ice_nine'
require 'ice_nine/core_ext/object'

# Library namespace
module Vanguard

  # Define constant singleton class
  #
  # @param [Class] klass
  # @param [Symbol] name
  #
  # @return [self]
  #
  # @api private
  #
  def self.singleton_constant(klass, name, &block)
    subclass = Class.new(klass) do
      # Return inspection string
      #
      # @return [String]
      #
      # @api private
      #
      def inspect
        klass = self.class
        "#{klass.superclass.name}::#{klass.name}".freeze
      end
    end
    subclass.class_eval(&block)
    klass.const_set(name, subclass.new)
    self
  end

end 

require 'vanguard/support/blank'
require 'vanguard/evaluator'
require 'vanguard/dsl'
require 'vanguard/dsl/evaluator'
require 'vanguard/instance_methods'
require 'vanguard/validator'
require 'vanguard/validator/builder'
require 'vanguard/builder'
require 'vanguard/builder/nullary'
require 'vanguard/matcher'
require 'vanguard/matcher/unary'
require 'vanguard/matcher/unary/attribute'
require 'vanguard/matcher/unary/not'
require 'vanguard/matcher/binary'
require 'vanguard/matcher/binary/and'
require 'vanguard/matcher/binary/or'
require 'vanguard/matcher/binary/xor'
require 'vanguard/matcher/nullary'
require 'vanguard/matcher/nullary/proc'
require 'vanguard/matcher/nullary/format'
require 'vanguard/matcher/nullary/primitive'
require 'vanguard/matcher/nullary/inclusion'
require 'vanguard/matcher/nullary/equality'
require 'vanguard/matcher/nullary/identity'
require 'vanguard/matcher/nullary/greater_than'
require 'vanguard/matcher/nullary/less_than'
require 'vanguard/matcher/nullary/value'
require 'vanguard/rule'
require 'vanguard/rule/guard'
require 'vanguard/rule/nullary'
require 'vanguard/rule/nullary/confirmation'
require 'vanguard/rule/nullary/attribute'
require 'vanguard/rule/nullary/attribute/format'
require 'vanguard/rule/nullary/attribute/length'
require 'vanguard/rule/nullary/attribute/absence'
require 'vanguard/rule/nullary/attribute/presence'
require 'vanguard/rule/nullary/attribute/primitive'
require 'vanguard/rule/nullary/attribute/inclusion'
require 'vanguard/rule/nullary/attribute/predicate'
require 'vanguard/violation'
require 'vanguard/result'
