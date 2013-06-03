require 'spec_helper'

describe Vanguard::DSL, '#validates_length_of' do
  include Spec::Shared::DSL

  describe 'with fixnum :length option' do
    before do
      builder.validates_length_of attribute_name, :length => 3
    end

    describe 'when validated attribute value is expected length' do
      let(:attribute_value) { 'foo' }

      it_should_be_a_valid_instance
    end

    describe 'when validated attribute value is not expected length' do
      let(:attribute_value) { 'barz' }

      it_should_be_an_invalid_instance
    end
  end

  describe 'with  :maximum option' do
    before do
      builder.validates_length_of attribute_name, :maximum => 3
    end

    describe 'when validated attribute value is at most expected length' do
      let(:attribute_value) { 'foo' }

      it_should_be_a_valid_instance
    end

    describe 'when validated attribute value is more than expected length' do
      let(:attribute_value) { 'barz' }

      it_should_be_an_invalid_instance
    end
  end

  describe 'with :minimum option' do
    before do
      builder.validates_length_of attribute_name, :minimum => 3
    end

    describe 'when validated attribute value is at least expected length' do
      let(:attribute_value) { 'foo' }

      it_should_be_a_valid_instance
    end

    describe 'when validated attribute value is less than expected length' do
      let(:attribute_value) { 'bz' }

      it_should_be_an_invalid_instance
    end
  end

  describe 'with range :length options' do
    before do
      builder.validates_length_of attribute_name, :length => 2..3
    end

    describe 'when validated attribute value length is within expected range' do
      let(:attribute_value) { 'foo' }

      it_should_be_a_valid_instance
    end

    describe 'when validated attribute value length is not within expected range' do
      let(:attribute_value) { 'barz' }

      it_should_be_an_invalid_instance
    end
  end
end
