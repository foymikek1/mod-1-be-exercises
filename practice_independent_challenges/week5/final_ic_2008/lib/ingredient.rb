class Ingredient
  attr_reader :name, :unit, :calories

  def initialize(args)
    @name = args[:name]
    @unit = args[:unit]
    @calories = args[:calories]
  end
end