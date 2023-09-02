require_relative 'person'
require_relative 'classroom'

# The Student class represents a student with an id, name, age, and classroom.
# It inherits from the Person class and includes an additional method to play hooky.
class Student < Person
  attr_reader :classroom

  def initialize(age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = nil
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end
end
