require 'spec_helper'

describe Classroom do
  before :each do
    @classroom = Classroom.new('Mathematics')
  end

  context 'When Working with classroom it should' do
    it 'return a new classroom' do
      expect(@classroom).to be_an_instance_of Classroom
    end

    it 'return an array of students' do
      expect { @classroom.add_student('Leehaney') }.to raise_error(NoMethodError)
    end

    it 'return class label' do
      expect(@classroom.label).to eq 'Mathematics'
    end

    it 'return the list of students' do
      expect(@classroom.students).to eq []
    end
  end
end
