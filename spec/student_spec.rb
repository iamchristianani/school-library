require 'spec_helper'

describe Person do
  let(:person) { Person.new(20, 'Leehaney', parent_permission: true) }
  let(:book) { Book.new('Half of a Yellow Sun', 'Chimamanda Adichie') }
  let(:date) { '20/01/2023' }
  let(:rental) { Rental.new(date, person, book) }

  describe '#can_use_services?' do
    it 'returns true if the person is 18 or older' do
      expect(person.can_use_services?).to eq(true)
    end

    it 'returns true if the person is under 18 and has parent permission' do
      person = Person.new(17, 'Peter', parent_permission: true)
      expect(person.can_use_services?).to eq(true)
    end

    it 'returns false if the person is under 18 and does not have parent permission' do
      person = Person.new(17, 'Peter', parent_permission: false)
      expect(person.can_use_services?).to eq(false)
    end
  end

  describe '#correct_name' do
    it 'returns the correct name' do
      expect(person.correct_name).to eq('Leehaney')
    end
  end

  describe '#add_rental' do
    it 'adds a rental to the person' do
      person.add_rental(rental)
      expect(person.rentals).to include(rental)
    end
  end
end