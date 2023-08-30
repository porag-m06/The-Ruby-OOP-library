require_relative 'person'

# The Student class represents a student with an id, name, age, and classroom.
# It inherits from the Person class and includes an additional method to play hooky.
class Student < Person
  attr_accessor :classroom

  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(name, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
