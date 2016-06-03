#item class

class Item
  attr_reader :name, :price, :imported
  def initialize(name, price, imported)
    @name = name
    @price = price
    @imported = imported
  end

end

#book = Item.new(book1, 30, true0)
