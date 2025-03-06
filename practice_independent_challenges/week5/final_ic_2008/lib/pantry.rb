class Pantry
  attr_accessor :stock

  def initialize
    @stock = {}
  end

  def stock_check(ingredient)
    if @stock[ingredient] == nil
      0
    else
      @stock[ingredient]
    end
  end

  def restock(ingredient, amount)
    if @stock[ingredient] == nil
      @stock[ingredient] = amount
    else
      @stock[ingredient] += amount
    end
  end

  def enough_ingredients_for?(recipe)
    query = nil
    recipe.ingredients_required.each do |ingredient, amount|
      if @stock.include?(ingredient) && @stock[ingredient] >= recipe.ingredients_required[ingredient]
        query = true
      else
        return false
      end
    end
    query
  end

end