module Vanguard
  # Abstract base class for builders
  class Builder
    include Adamantium::Flat, AbstractType

    # Return rules
    #
    # @return [Enumerable<Rule>]
    #
    # @api private
    #
    abstract_method :rules
  end
end
