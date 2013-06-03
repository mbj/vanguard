#encoding: utf-8

module Vanguard
  class Rule
    class Nullary
      class Attribute

        # Attribute absence rule
        class Absence < self

          register :validates_absence_of
          MATCHER = Matcher::Nullary::BLANK

        end 

      end 
    end 
  end
end
