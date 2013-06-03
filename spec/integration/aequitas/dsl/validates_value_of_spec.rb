require 'spec_helper'

describe Vanguard::DSL, '#validates_value_of' do
  include Spec::Shared::DSL

  before do
    pending
  end


  describe 'with a lambda that returns lower and upper bounds' do
    before do
      builder.validates_value_of attribute_name, :in => bound
    end

    let(:bound) { lambda { (Date.today - 5)..Date.today } }

    describe 'when validated attribute value is within the range' do
      let(:attribute_value) { bound.call.begin + 1 }

      it_should_be_a_valid_instance
    end

    describe 'when validated attribute value is not within the range' do
      let(:attribute_value) { bound.call.end + 1 }

      it_should_be_an_invalid_instance
    end
  end
end
