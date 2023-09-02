require_relative 'app'

# This the main.rb as the entry point
class Main
  def initialize(app)
    @app = app
  end

  def run
    puts ''
    puts 'Welcome to School Library App!'
    puts ''
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    puts ''

    option = gets.chomp.to_i

    case option
    when 1
      @app.list_all_books
    when 2
      @app.list_all_people
    when 3
      @app.create_person
    when 4
      @app.create_book
    when 5
      @app.create_rental
    when 6
      @app.list_rentals_for_person_id
    when 7
      puts 'Thank you for using this app!'
      return
    else
      puts 'Invalid option. Please try again.'
    end

    run
  end
end

app = App.new # assuming App class is defined in another file and required at the top of this file.
main = Main.new(app)
main.run
