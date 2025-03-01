class Dish
  attr_reader :name
  attr_accessor :category

  def initialize(name, category)
    @name = name
    @category = category
  end
end