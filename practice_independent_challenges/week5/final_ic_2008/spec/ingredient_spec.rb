require '../lib/ingredient'
require '../lib/pantry'

describe "Ingredient" do
  describe "#initialize" do
    it 'is an Ingredient' do
      ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
      expect(ingredient1).to be_a Ingredient
    end
    
    it 'has a name' do
      ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
      expect(ingredient1.name).to eq "Cheese"
    end

    it 'has a unit' do
      ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
      expect(ingredient1.unit).to eq "oz"
    end

    it 'has a calorie count' do
      ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
      expect(ingredient1.calories).to eq 50
    end
  end
end