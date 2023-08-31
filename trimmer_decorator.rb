require_relative 'base_decorator'

# This class makes sure that the output of @nameable has a maximum
# of 10 characters
class TrimmerDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name[0..9]
  end
end
