#encoding: utf-8

module Vanguard
  class Rule
    class Nullary

      # For for testing attribute confirmations
      class Confirmation < self
        include Equalizer.new(:attribute_name, :confirmation_attribute_name)

        TYPE = :confirmation

        # Builder for confirmation
        class Builder < Nullary::Builder
          OPTIONS = [:confirm]

          # Abstract base class for confirmation attribute name generators
          class Confirm
            include Adamantium::Flat, AbstractType

            Vanguard.singleton_constant(self, :DEFAULT) do

              # Return confirmation attribute name
              #
              # @param [Symbol] attribute_name
              #
              # @return [Symbol]
              #
              # @api private
              #
              def confirmation_attribute_name(attribute_name)
                :"#{attribute_name}_confirmation"
              end

            end

            # Build confirm object
            #
            # @return [Confirm]
            #
            # @api private
            #
            def self.build(value)
              case value
              when value.respond_to?(:call)
                Block.new(value)
              when Symbol, String
                Static.new(value.to_sym)
              else
                raise "Cannot build confirm option from: #{value.inspect}"
              end
            end

            # Confirm attribute from block
            class Block 

              # Return confirmation attribute name
              #
              # @param [Symbol] attribute_name
              #
              # @return [Symbol]
              #
              # @api private
              #
              def confirmation_attribute_name(attribute_name)
                @block.call(attribute_name)
              end

            private

              # Initialize object
              #
              # @param [Proc] block
              #
              # @return [undefined]
              #
              # @api private
              def initialize(block)
                @block = block
              end
            end

            # Static confirmation attribute
            class Static

              # Return confirmation attribute name
              #
              # @param [Symbol] attribute_name
              #
              # @return [Symbol]
              #
              # @api private
              #
              def confirmation_attribute_name(attribute_name)
                @confirmation_attribute_name
              end

            private

              # Initialize object
              #
              # @param [Symbol] confirmation_attribute_name
              #
              # @return [undefined]
              #
              # @api private
              #
              def initialize(confirmation_attribute_name)
                @confirmation_attribute_name = confirmation_attribute_name
              end
            end
          end

        private

          # Return rule 
          #
          # @param [Symbol] attribute_name
          #
          # @api private
          #
          def rule(attribute_name)
            klass.new(attribute_name, confirm_option.confirmation_attribute_name(attribute_name))
          end

          # Return confirm object
          #
          # @return [Confirm]
          #
          # @api private
          #
          def confirm_option
            option = options.fetch(:confirm) do 
              return Confirm::DEFAULT
            end

            Confirm.build(option)
          end
          memoize :confirm_option
        end

        register :validates_confirmation_of

        # Return attribute name
        #
        # @return [Symbol]
        #
        # @api private
        #
        attr_reader :attribute_name

        # Return confirmation attribute name
        #
        # @return [Symbol]
        #
        # @api private
        #
        attr_reader :confirmation_attribute_name

        # Initialize object
        #
        # @param [Symbol] attribute_name
        # @param [Symbol] confirmation_attribute_name
        #
        # @return [undefined]
        #
        # @api private
        #
        def initialize(attribute_name, confirmation_attribute_name)
          @attribute_name, 
          @confirmation_attribute_name = 
            attribute_name, 
            confirmation_attribute_name
        end

        # Evaluator for confirmation rule
        class Evaluator < Vanguard::Evaluator
          # Test if value is valid?
          #
          # @return [true]
          #   if value is valid
          #
          # @return [false]
          #   if value is valid
          #
          # @api private
          #
          def valid?
            value.eql?(confirmation_value)
          end
          memoize :valid?

        private

          # Return confirmation value
          #
          # @return [Object]
          #
          # @api private
          #
          def confirmation_value
            resource.public_send(rule.confirmation_attribute_name)
          end
          memoize :confirmation_value
        end

      end 
    end 
  end 
end
