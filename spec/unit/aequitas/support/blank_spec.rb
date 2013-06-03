require 'spec_helper'

describe Vanguard, '.blank?' do
  subject { Vanguard.blank?(value) }

  [
    nil,
    false,
    [],
    {},
    '',
    "\n",
  ].each do |value|
    context "when value is #{value.inspect}" do
      let(:value) { value }
      it { should be(true) }
    end
  end

  context 'with object' do
    let(:value) { Object.new }

    before do
      value.stub(:nil? => is_nil)
      value.stub(:empty? => is_empty)
    end

    context 'that is not #nil?' do
      let(:is_nil) { false }

      context 'and #empty?' do
        let(:is_empty) { true }

        it { should be(true) }
      end

      context 'and not #empty' do
        let(:is_empty) { false }

        it { should be(false) }
      end
    end

    context 'that is #nil?' do
      let(:is_nil) { true }

      context 'and #empty?' do
        let(:is_empty) { true }
        it { should be(true) }
      end

      context 'and not #empty?' do
        let(:is_empty) { false }
        it { should be(true) } 
      end
    end
  end

  [
    1,
    true,
    { :foo => :bar },
    [:foo],
    'foo',
  ].each do |value|
    context "when value is #{value.inspect}" do
      let(:value) { value }
      it { should be(false) }
    end
  end

end
