require 'spec_helper'

describe Rental do

  before :each do
    @person = Person.new(28, 'Christian Ani', parent_permission: true)
    @book = Book.new("Things Fall Apart", "Chinua Achebe")
    @rental = Rental.new('12/12/2023', @person, @book)
  end 

  context  "When creating a rental class" do
    it 'Should return a new rental' do
      expect(@rental).to be_an_instance_of Rental
    end

    it 'Should have a person' do
      expect(@rental.person).to be_an_instance_of Person
    end

    it 'Should have a book' do
      expect(@rental.book).to be_an_instance_of Book
    end

    it 'Should have the right date' do
      expect(@rental.date).to eq '12/12/2023'
    end
  end
end