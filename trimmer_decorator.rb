require_relative './baseDecorator'

class TrimmerDecorator < BaseDecorator
  MAX_NAME_LENGTH = 10

  def correct_name
    name = super
    name.length > MAX_NAME_LENGTH ? name[0, MAX_NAME_LENGTH] : name
  end
end
