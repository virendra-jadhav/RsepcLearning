class User
  attr_accessor :name
  def initialize(name)
    @name = name    
  end
  def name
    @name
  end
  def activate
    true
  end
end