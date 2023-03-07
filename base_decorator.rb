require_relative './nameable'

class BaseDecorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  attr_reader :nameable

  def correct_name
    @nameable.correct_name
  end
end
