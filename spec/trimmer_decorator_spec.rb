require 'spec_helper'

describe TrimmerDecorator do
  let(:nameable) { instance_double('Nameable', correct_name: 'John Doe') }
  subject(:decorator) { described_class.new(nameable) }

  describe '#correct_name' do
    context 'when the name is longer than the maximum length' do
      let(:nameable) { instance_double('Nameable', correct_name: 'A very long name') }

      it 'trims the name to the maximum length' do
        expect(decorator.correct_name).to eq('A very lon')
      end
    end

    context 'when the name is not longer than the maximum length' do
      let(:nameable) { instance_double('Nameable', correct_name: 'John Doe') }

      it 'returns the original name' do
        expect(decorator.correct_name).to eq('John Doe')
      end
    end
  end
end