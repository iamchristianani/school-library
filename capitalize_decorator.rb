require_relative './baseDecorator'

class CapitalizeDecorator < BaseDecorator
  def correct_name
    super.capitalize
  end
end
