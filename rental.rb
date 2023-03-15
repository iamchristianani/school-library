class Rental
  attr_accessor :date, :book, :person

  def initialize(date, person, book)
    @date = date
    @book = book
    @person = person
    
    book.add_rented(self)
    person.add_rental(self)
  end
end