require '../lib/ingredient'
require '../lib/pantry'
require '../lib/cookbook'
require '../lib/recipe'

describe "CookBook" do
  describe "#initialize" do
    it 'is a CookBook' do
      cookbook = CookBook.new
      expect(cookbook).to be_a CookBook
    end

    it 'has recipies' do
      cookbook = CookBook.new
      expect(cookbook.recipes).to eq []
    end
  end

  describe "CookBook methods" do
    it 'can add recipies' do
      recipe1 = Recipe.new("Mac and Cheese")
      recipe2 = Recipe.new("Cheese Burger")
      cookbook = CookBook.new
      cookbook.add_recipe(recipe1)
      cookbook.add_recipe(recipe2)
      expect(cookbook.recipes).to eq [recipe1, recipe2]
    end

      it 'can return highest calorie meal' do
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
      cookbook.add_recipe(recipe1)
      cookbook.add_recipe(recipe2)

      expect(cookbook.highest_calorie_meal).to eq recipe2
      end
      
     it 'can return all ingredients' do
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
      cookbook.add_recipe(recipe1)
      cookbook.add_recipe(recipe2)

      expect(cookbook.ingredients).to eq ["Cheese", "Macaroni", "Ground Beef", "Bun"]
      end
  end
end