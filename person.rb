class Person
  def initialize(age, name = 'Unknown', _parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
  end

  attr_reader :id
  attr_accessor :name, :age

  def of_age?
    @age.to_i >= 18
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private :of_age?
end
