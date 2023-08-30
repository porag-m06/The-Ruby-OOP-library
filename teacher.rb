require_relative 'person'

# The Teacher class represents a teacher with a name, age, and specialization.
# It inherits from the Person class and overrides the method can_use_services?.
class Teacher < Person
  attr_accessor :specialization

  def initialize(age, specialization, name = 'Unknown', parent_permission: true)
    super(name, age, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
