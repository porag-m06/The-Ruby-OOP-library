require_relative 'nameable'

# This is the base decorator class with a method that returns the
# result of the correct_name method of the @nameable which is an
# object of the Nameable class
class BaseDecorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end
