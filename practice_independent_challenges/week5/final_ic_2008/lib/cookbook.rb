class CookBook
  attr_accessor :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def highest_calorie_meal
    calorie_count = 0
    highest = nil
    @recipes.each do |recipe|
      if recipe.total_calories > calorie_count
        highest = recipe
        calorie_count = recipe.total_calories
      end
    end
    highest
  end

  def ingredients
    total_ingredients = []
    @recipes.each do |recipe|
      recipe.ingredients_required.keys.each do |ingredient|
        total_ingredients << ingredient.name
      end
    end
    total_ingredients.uniq
  end
end