class Recipe
  attr_reader :name
  attr_accessor :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = {}
  end

  def add_ingredient(ingredient, amount)
    if @ingredients_required[ingredient] == nil
      @ingredients_required[ingredient] = amount
    else
      @ingredients_required[ingredient] += amount
    end
  end

  def total_calories
    calories = 0 
    @ingredients_required.count do |ingredient, amount|
      calories += ingredient.calories * amount
    end
    calories
  end
end