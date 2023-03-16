require 'spec_helper'

describe BaseDecorator do
  let(:nameable) { double('Nameable', correct_name: 'John Doe') }
  subject { described_class.new(nameable) }

  describe '#initialize' do
    it 'assigns the nameable object' do
      expect(subject.nameable).to eq(nameable)
    end
  end

  describe '#correct_name' do
    it 'calls correct_name on the nameable object' do
      expect(nameable).to receive(:correct_name)
      subject.correct_name
    end

    it 'returns the correct name from the nameable object' do
      expect(subject.correct_name).to eq('John Doe')
    end
  end
end
