require 'spec_helper'

describe Vanguard::DSL, '#validates_acceptance_of' do
  include Spec::Shared::DSL

  before { builder.validates_acceptance_of attribute_name }

  describe 'when attribute value is accepted' do
    let(:attribute_value) { true }

    it_should_be_a_valid_instance
  end

  describe 'when attribute value is not accepted' do
    let(:attribute_value) { false }

    it_should_be_an_invalid_instance
  end
end
