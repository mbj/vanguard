require 'spec_helper'

describe Vanguard::DSL, 'guard specs' do
  include Spec::Shared::DSL

  before do 
    class_under_test.class_eval do
      def foo?
        !!@foo
      end

      attr_accessor :foo
    end
    builder.validates_presence_of(attribute_name,options) 
  end

  context 'with :if option' do
    let(:options) { { :if => :foo? } }
    
    context 'when predicate is true' do
      before do
        resource.foo = true
      end

      describe 'when validated attribute is present' do
        let(:attribute_value) { :foo }

        it_should_be_a_valid_instance
      end

      describe 'when validated attribute is absent' do
        let(:attribute_value) { nil }

        it_should_be_an_invalid_instance
      end
    end
    
    context 'when predicate is false' do
      before do
        resource.foo = false
      end

      describe 'when validated attribute is present' do
        let(:attribute_value) { :foo }

        it_should_be_a_valid_instance
      end

      describe 'when validated attribute is absent' do
        let(:attribute_value) { nil }

        context 'and options include :if predicate' do
          it_should_be_a_valid_instance
        end
      end
    end
  end
end
