require 'spec_helper'

describe Teacher do
  before :each do
    @teacher = Teacher.new(45, 'English', 'Martin King', parent_permission: true)
  end

  context 'When creating a teacher class' do
    it 'Should return a new Teacher' do
      expect(@teacher).to be_an_instance_of Teacher
    end

    it 'Should raise an error' do
      expect { Teacher.new(45, 'English', parent_permission: true) }.to raise_error(ArgumentError)
    end

    it 'Should return a true value' do
      expect(@teacher.can_use_services?).to be true
    end

    it 'Retruns the correct name' do
      expect(@teacher.name).to eq 'Martin King'
    end
  end
end
