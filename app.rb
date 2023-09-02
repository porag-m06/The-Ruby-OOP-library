require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

class App
  def initialize
    @books = []
    @people = []
  end

  def main
    puts "Welcome to School Library App!"
    puts ""
    puts "Please choose an option by entering a number:"
    puts "1 - List all books"
    puts "2 - List all people"
    puts "3 - Create a person"
    puts "4 - Create a book"
    puts "5 - Create a rental"
    puts "6 - List all rentals for a given person id"
    puts "7 - Exit"
    puts ""

    option = gets.chomp.to_i

    case option
    when 1
      list_all_books
    when 2
      list_all_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals_for_person_id
    when 7
      puts "Thank you for using this app!"
      return
    else
      puts "Invalid option. Please try again."
    end

    main
  end

  private

  def list_all_books
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_all_people
    @people.each do |person|
      type = person.is_a?(Student) ? '[Student]' : '[Teacher]'
      puts "#{type} Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_person
    print "Do you want to create a student (1) or a teacher (2)? [Input the number]: "
    type = gets.chomp.to_i

    print "Age: "
    age = gets.chomp.to_i

    print "Name: "
    name = gets.chomp

    case type
    when 1 # Student
      print "Has parent permission? [Y/N]: "
      parent_permission = gets.chomp.downcase == 'y'

      student = Student.new(age, name, parent_permission: parent_permission)
      @people << student

      puts "Person created successfully"
    when 2 # Teacher
      print "Specialization: "
      specialization = gets.chomp

      teacher = Teacher.new(age, specialization, name)
      @people << teacher

      puts "Person created successfully"
    else
      puts "Invalid option. Please try again."
      return create_person
    end
  end

  def create_book
    print "Title: "
    title = gets.chomp

    print "Author: "
    author = gets.chomp

    book = Book.new(title, author)
    @books << book

    puts "Book Created Successfully"
  end

  def create_rental
    puts "Select a book from the following list by number"
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end

    book_index = gets.chomp.to_i
    puts ""
    puts "Select a person from the following list by number (not id)"
    @people.each_with_index do |person, index|
      type = person.is_a?(Student) ? '[Student]' : '[Teacher]'
      puts "#{index}) #{type} Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end

    person_index = gets.chomp.to_i

    print "Date: "
    date = gets.chomp

    Rental.new(date, @books[book_index], @people[person_index])

    puts "Rental created successfully"
  end

  def list_rentals_for_person_id
    print "ID of person: "
    id = gets.chomp.to_i

    person = @people.find { |person| person.id == id }

    if person.nil?
      puts "Person not found"
      return
    end

    puts "Rentals:"
    person.rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end
end

app = App.new
app.main

    