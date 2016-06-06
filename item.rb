#item class

class Item
  attr_reader :name, :price, :imported, :free_of_tax
  def initialize(name, price, imported, free_of_tax)
    @name = name
    @price = price
    @imported = imported
    @free_of_tax = free_of_tax
  end


  # def little_helper
  #
  # end

end

#book = Item.new(book1, 30, true0)
