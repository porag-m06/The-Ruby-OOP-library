# Rental class with data attribute
class Rental
  attr_accessor :data, :book, :person

  def initialize(data, book, person)
    @data = data
    @book = book
    @person = person
    book.rentals << self
    person.rentals << self
  end
end
