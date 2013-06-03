module Vanguard

  # Determines whether the specified +value+ is blank
  #
  # @param [Object] value
  #
  # @return [true]
  #   if object is fale empty or a whitespace string
  #
  # @return [false]
  #   otherwise
  #
  # @api private
  #
  def self.blank?(value)
    case value
    when ::NilClass, ::FalseClass
      true
    when ::TrueClass, ::Numeric
      false
    when ::Array, ::Hash
      value.empty?
    when ::String
      value !~ /\S/
    else
      value.nil? || (value.respond_to?(:empty?) && value.empty?)
    end
  end
end
