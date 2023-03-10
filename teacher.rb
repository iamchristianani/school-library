require './person'

class Teacher < Person
  def initialize(specialization, age, name, parent_permission: true)
    super(name)
    @specialization = specialization
    @age = age
    @parent_permission = parent_permission
    @name = name
  end

  def can_use_services?
    true
  end
end
