require_relative 'base_decorator'

# This class capitalizes the output of @nameable and capitalizes the output of @nameable.
class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end
