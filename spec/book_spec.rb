require 'spec_helper'

describe Book do
  let(:title) { 'Things Fall Apart' }
  let(:author) { 'Chinua Achebe' }
  let(:book) { Book.new(title, author) }
  let(:person) { instance_double('Person') }
  let(:rental) { double('rental') }

  describe '#initialize' do
    it 'sets the title and author attributes' do
      expect(book.title).to eq(title)
      expect(book.author).to eq(author)
    end

    it 'initializes the rentals array to an empty array' do
      expect(book.rentals).to eq([])
    end
  end

  describe '#add_rented' do
    it 'adds a rental to the rentals array' do
      book.add_rented(rental)
      expect(book.rentals).to include rental
    end
  end
end
