require 'spec_helper'

describe CapitalizeDecorator do
  let(:nameable) { instance_double(Nameable, correct_name: 'john doe') }
  subject { described_class.new(nameable) }

  describe '#correct_name' do
    it 'capitalizes the name of the nameable object' do
      expect(subject.correct_name).to eq('John doe')
    end
  end

  describe '#nameable' do
    it 'returns the nameable object that was passed in during initialization' do
      expect(subject.nameable).to eq(nameable)
    end
  end
end
