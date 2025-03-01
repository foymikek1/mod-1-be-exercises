require 'rspec'
require '../lib/dish'
require '../lib/potluck'

describe Dish do
  describe '#initialize' do
    it 'is a Dish' do
      dish = Dish.new("Couscous Salad", :appetizer)
      expect(dish).to be_a Dish
    end

    it 'can read name' do
      dish = Dish.new("Couscous Salad", :appetizer)
      expect(dish.name).to eq "Couscous Salad"
    end

    it 'can read category' do
      dish = Dish.new("Couscous Salad", :appetizer)
      expect(dish.category).to eq :appetizer
    end
  end
end

describe Potluck do
  describe '#initialize' do
    it 'is a Potluck' do
      potluck = Potluck.new("7-13-18")
      expect(potluck).to be_a Potluck
    end

    it 'has a date' do
      potluck = Potluck.new("7-13-18")
      expect(potluck.date).to eq "7-13-18"
    end

    it 'has a dishes attribute' do
      potluck = Potluck.new("7-13-18")
      expect(potluck.dishes).to eq []
    end

    it 'can add dishes' do
      couscous_salad = Dish.new("Couscous Salad", :appetizer)
      cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
      potluck = Potluck.new("7-13-18")

      potluck.add_dish(couscous_salad)

      potluck.add_dish(cocktail_meatballs)

      expect(potluck.dishes).to eq [couscous_salad, cocktail_meatballs]
      expect(potluck.dishes.length).to eq 2
    end

    it 'can get all from category' do
      potluck = Potluck.new("7-13-18")
      couscous_salad = Dish.new("Couscous Salad", :appetizer)
      summer_pizza = Dish.new("Summer Pizza", :appetizer)
      roast_pork = Dish.new("Roast Pork", :entre)
      cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
      candy_salad = Dish.new("Candy Salad", :dessert)

      potluck.add_dish(couscous_salad)
      potluck.add_dish(summer_pizza)
      potluck.add_dish(roast_pork)
      potluck.add_dish(cocktail_meatballs)
      potluck.add_dish(candy_salad)

      expect(potluck.get_all_from_category(:appetizer)).to eq [couscous_salad, summer_pizza]
      expect(potluck.get_all_from_category(:appetizer).first).to eq couscous_salad
      expect(potluck.get_all_from_category(:appetizer).first.name).to eq "Couscous Salad"
    end

    it 'can make a menu' do
      potluck = Potluck.new("7-13-18")
      couscous_salad = Dish.new("Couscous Salad", :appetizer)
      summer_pizza = Dish.new("Summer Pizza", :appetizer)
      roast_pork = Dish.new("Roast Pork", :entre)
      cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
      candy_salad = Dish.new("Candy Salad", :dessert)
      bean_dip = Dish.new("Bean Dip", :appetizer)

      potluck.add_dish(couscous_salad)
      potluck.add_dish(summer_pizza)
      potluck.add_dish(roast_pork)
      potluck.add_dish(cocktail_meatballs)
      potluck.add_dish(candy_salad)
      potluck.add_dish(bean_dip)

      menu = {:appetizer=>["Bean Dip", "Couscous Salad", "Summer Pizza"],
              :entre=>["Cocktail Meatballs", "Roast Pork"],
              :dessert=>["Candy Salad"]}

      expect(potluck.menu).to eq menu
      expect(potluck.ratio(:appetizer)).to eq 50.0
    end
  end
end