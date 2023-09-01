# Rental class with data attribute
class Rental
  attr_accessor :data, :book, :person

  def initialize(data, book, person)
    @data = data
    @book = book
    @person = person
    person.rentals << self
    book.rentals << self
  end
end
