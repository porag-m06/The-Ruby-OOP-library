# The correct_name method must be implemented in a class
# where this Nameable class is inherited
class Nameable
  def correct_name
    raise NotImplementedError, 'The correct_name method is not implemented'
  end
end
