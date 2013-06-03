require 'spec_helper'

describe Vanguard::DSL, '#validates_format_of' do
  include Spec::Shared::DSL

  describe 'with a Proc' do
    let(:attribute_value) { mock }

    before do
      builder.validates_format_of attribute_name, :format => lambda { |value| proc_return }
    end

    describe 'when format proc returns true' do
      let(:proc_return) { true }

      it_should_be_a_valid_instance
    end

    describe 'when validated attribute is absent' do
      let(:proc_return) { false }

      it_should_be_an_invalid_instance
    end
  end

  describe 'with a Regexp' do
    before do
      builder.validates_format_of attribute_name, :format => /foo/
    end

    describe 'when validated attribute is present' do
      let(:attribute_value) { 'foo' }

      it_should_be_a_valid_instance
    end

    describe 'when validated attribute is absent' do
      let(:attribute_value) { 'bar' }

      it_should_be_an_invalid_instance
    end
  end

  describe 'with :url' do
    before do
      builder.validates_format_of attribute_name, :format => :url
    end

    describe 'when validated attribute is a URL' do
      let(:attribute_value) { 'http://www.example.com' }

      it_should_be_a_valid_instance
    end

    describe 'when validated attribute is not a URL' do
      let(:attribute_value) { 'not a url' }

      it_should_be_an_invalid_instance
    end
  end

  describe 'with :email_address' do
    before do
      builder.validates_format_of attribute_name, :format => :email_address
    end

    describe 'when validated attribute is an email address' do
      let(:attribute_value) { 'address@example.com' }

      it_should_be_a_valid_instance
    end

    describe 'when validated attribute is not an email address' do
      let(:attribute_value) { 'not an email' }

      it_should_be_an_invalid_instance
    end
  end
end
