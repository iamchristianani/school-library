require 'spec_helper'

describe Person do
  let(:person) { Person.new(28, 'Christian Ani', parent_permission: true) }
  let(:book) { instance_double(Book) }
  let(:date) { '01/01/2023' }

  describe '#initialize' do
    it 'creates a new person with the given age and name' do
      expect(person.name).to eq('Christian Ani')
      expect(person.age).to eq(28)
    end

    it 'generates a random id for the person' do
      expect(person.id).to be_an(Integer)
    end

    it 'sets parent_permission to true by default' do
      person_without_permission = Person.new(10)
      expect(person_without_permission.can_use_services?).to be(true)
    end
  end

  describe '#can_use_services?' do
    it 'returns true if the person is 18 or older' do
      expect(person.can_use_services?).to be(true)
    end

    it 'returns true if the person is younger than 18 and has parent permission' do
      young_person = Person.new(10, parent_permission: true)
      expect(young_person.can_use_services?).to be(true)
    end

    it 'returns false if the person is younger than 18 and does not have parent permission' do
      young_person = Person.new(10, parent_permission: false)
      expect(young_person.can_use_services?).to be(false)
    end
  end

  describe '#correct_name' do
    it 'returns the name of the person' do
      expect(person.correct_name).to eq('Christian Ani')
    end
  end

  describe '#add_rental' do
    it 'adds a rental to the person' do
      rental = double(Rental)
      person.add_rental(rental)
      expect(person.rentals).to include(rental)
    end
  end
end