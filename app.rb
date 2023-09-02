# Console App entry-point
class App
  def initialize
    puts "Console App initialize..."
  end
  
  def run
    puts "Running console app now..."
  end
end

def main
  app = App.new()
  app.run()
end

main()