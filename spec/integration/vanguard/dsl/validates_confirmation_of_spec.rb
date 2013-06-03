require 'spec_helper'

describe Vanguard::DSL, '#validates_confirmation_of' do
  include Spec::Shared::DSL

  let(:confirmation_attribute_name) { "#{attribute_name}_explicit_confirmation" }

  before do
    class_under_test.send(:attr_accessor, confirmation_attribute_name)
    builder.validates_confirmation_of(attribute_name, :confirm => confirmation_attribute_name)
    resource.send("#{confirmation_attribute_name}=", confirmation_value)
  end

  describe 'when confirmation value matches' do
    let(:attribute_value)    { :foo }
    let(:confirmation_value) { :foo }

    it_should_be_a_valid_instance
  end

  describe 'when confirmation value does not match' do
    let(:attribute_value) { :foo }
    let(:confirmation_value) { :bar }

    it_should_be_an_invalid_instance
  end
end
