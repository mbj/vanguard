#encoding: utf-8

module Vanguard
  class Rule
    class Nullary
      class Attribute

        # Rule that tests inputs against formats
        class Format < self
          TYPE = :invalid

          # Builder for format rule
          class Builder < Builder::Nullary
            REQUIRED_OPTIONS = [:format].freeze

          private

            # Return rule for attribute name
            #
            # @return [Rule]
            #
            # @api private
            #
            def rule(name)
              klass.new(name, matcher)
            end

            # Return format matcher
            #
            # @return [Matcher::Format]
            #
            # @api private
            #
            def matcher
              Matcher::Nullary::Format.build(options.fetch(:format))
            end
            memoize :matcher
          end

          register :validates_format_of

        end 
      end 
    end 
  end
end
