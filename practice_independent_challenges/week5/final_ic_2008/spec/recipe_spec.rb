require '../lib/ingredient'
require '../lib/pantry'
require '../lib/cookbook'
require '../lib/recipe'

describe "Recipe" do
  describe "#initialize" do
    it 'is a Recipe' do
      recipe1 = Recipe.new("Mac and Cheese")
      expect(recipe1).to be_a Recipe
    end

    it 'has a name' do
      recipe1 = Recipe.new("Mac and Cheese")
      expect(recipe1.name).to eq ("Mac and Cheese")
    end

    it 'has ingredients required' do
      recipe1 = Recipe.new("Mac and Cheese")
      expected = {}
      expect(recipe1.ingredients_required).to eq expected
    end

    it 'can add ingredients' do
      recipe1 = Recipe.new("Mac and Cheese")
      ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
      ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})  
      recipe1.add_ingredient(ingredient1, 2)
      recipe1.add_ingredient(ingredient1, 4)
      recipe1.add_ingredient(ingredient2, 8)
      expected = {ingredient1 => 6, ingredient2 => 8}
      expect(recipe1.ingredients_required).to eq expected
    end

    it 'returns total recipe calories' do
      pantry = Pantry.new
      cookbook = CookBook.new
      ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
      ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
      recipe1 = Recipe.new("Mac and Cheese")
      recipe1.add_ingredient(ingredient1, 2)
      recipe1.add_ingredient(ingredient2, 8)
      ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
      ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
      recipe2 = Recipe.new("Cheese Burger")
      recipe2.add_ingredient(ingredient1, 2)
      recipe2.add_ingredient(ingredient3, 4)
      recipe2.add_ingredient(ingredient4, 1)

      expect(recipe1.total_calories).to eq 440
      expect(recipe2.total_calories).to eq 675
    end
  end
end
