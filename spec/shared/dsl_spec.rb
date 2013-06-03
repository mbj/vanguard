module Spec
  module Shared
    module DSL 
      def self.included(base) 
        base.class_eval do

          let(:rules) do
            validator.on(attribute_name).select do |rule|
              rule.instance_of?(class_of_violated_validation_rule)
            end
          end

          let(:class_of_violated_validation_rule) do
            validator.on(attribute_name).first.class
          end

          let(:attribute_name) { :attribute_under_test }

          let(:expected_violations) do
            rules.map { |rule| Vanguard::Violation.new(rule, resource) }
          end

          let(:class_under_test) do
            attribute_name = self.attribute_name

            Class.new do
              def inspect; 'Resource'; end

              attr_accessor attribute_name

              define_method(:initialize) do |attribute_value|
                send("#{attribute_name}=", attribute_value)
              end
            end
          end

          let(:builder) do
            Vanguard::Validator::Builder.new
          end

          let(:resource)  { class_under_test.new(attribute_value) }
          let(:validator) { builder.validator                     }

          subject { validator.call(resource) }

          def self.it_should_be_a_valid_instance
            its(:valid?) { should be(true) }

            its(:violations) { should be_empty }

            it 'validations on attribute name is empty' do
              subject.on(attribute_name).should be_empty
            end
          end

          def self.it_should_be_an_invalid_instance
            its(:valid?) { should be(false) }

            its(:violations) { should_not be_empty }

            it '#violations has one member' do
              subject.violations.size.should be(1)
            end

            it 'has a violation under the expected attribute name' do
              subject.on(attribute_name).should eql(expected_violations)
            end
          end
        end
      end
    end 
  end 
end
