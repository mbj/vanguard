module Vanguard
  # Abstract base class for matchers
  class Matcher
    include Adamantium::Flat, AbstractType

    # Test if value matches
    #
    # @return [true]
    #   if value matches
    #
    # @return [false]
    #   otherwise
    #
    # @api private
    #
    abstract_method :matches?

  end
end
