require_relative 'app'

# This the main.rb as the entry point
class Main
  def initialize(app)
    @app = app
  end

  def run
    @app.app_instruction
    option = gets.chomp.to_i
    app_options(option)
  end

  def app_options(option)

    if(option == 7)
      puts 'Thank you for using this app!'
      return
    end

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
    else
      puts 'Invalid option. Please try again.'
    end

    run
  end
end

app = App.new # assuming App class is defined in another file and required at the top of this file.
main = Main.new(app)
main.run
