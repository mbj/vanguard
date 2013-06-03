#encoding: utf-8

module Vanguard
  class Rule
    class Nullary
      class Attribute

        # Rule for testing attribute presance
        class Presence < self
          TYPE = :presence
          MATCHER = Matcher::Unary::NOT.new(Matcher::Nullary::BLANK)
          register :validates_presence_of

        private

          # Initalize object
          #
          # @param [Symbol] attribute_name
          # @param [Matcher] matcher
          #
          # @return [undefined]
          #
          # @api private
          #
          def initialize(attribute_name, matcher = MATCHER)
            super
          end
        end
      end 
    end 
  end
end
