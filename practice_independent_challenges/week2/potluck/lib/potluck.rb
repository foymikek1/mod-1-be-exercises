class Potluck
  attr_accessor :date, :dishes

  def initialize(date)
    @date = date
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def get_all_from_category(category)
   @dishes.find_all {|dish| dish.category == category }
  end

  def menu
    menu = Hash.new {|hash, key| hash[key] = []}
    @dishes.each do |dish|
      menu[dish.category] << dish.name
    end
    menu = menu.each do |category, dish|
      dish.sort!
    end
    menu
  end

  def ratio(category)
    category_count = get_all_from_category(category).count
    all_menu_items = menu.values
    menu_count = all_menu_items.flatten.count
    (category_count.to_f / menu_count.to_f) * 100
  end

end