#require_relative 'item'
#receipt class
class Item
  attr_reader :name, :price, :imported, :free_of_tax
  def initialize(name, price, imported, free_of_tax)
    @name = name
    @price = price
    @imported = imported
    @free_of_tax = free_of_tax
  end
end

#------------------------------------------------------------------------------

class Receipt

#total for the recepitp print
    @@counter_total = 0
    @@counter_tax = 0

#iniciando instance variable
  def initialize
    @price = 0
    @tax = 0
    #an array to keep the items shopping_cart
    @shopping_cart = []
    #user selector
  #  @item_to_add = 0
  end

#calcula el tax

  def tax(item)
    free = item.free_of_tax
    @price = item.price
    if free == false
    @tax = @price * 0.10
    @price = @price + @tax
    end
    import_tax
  end

#calcula el impuesto de importacion

  def import_tax(item)
    imported = item.imported
    if imported == true
      @tax = @tax + (@price * 0.05)
      @price = @price + @tax
    end
    add_to_total
  end

#suma al total de la factura y el total de impuesto

  def add_to_total
    @@counter_total = @@counter_total + @price
    @@counter_tax = @@counter_tax + @tax
  end

# lets the user pick a product from the list

  def pick_a_product
    puts "Pick a product from the list, type the number of the item to add it to the shopping cart"
    puts " 1 ... Book at 12.49"
    puts " 2 ... Food 10.99"
    puts " 3 ... Music CD 14.99"
    puts " 4 ... Medicine 32.60"
    puts " 5 ... Chocolate bar 0.85"
    item_to_add = gets.chomp
    case @item_to_add
    when 1
      self.add_item(book)
      puts "You have added a Book"
    when 2
      self.add_item(food)
      puts "You have added Food"
    when 3
      self.add_item(music_cd)
      puts "You have added a Music cd"
    when 4
      self.add_item(medicine)
      puts "You have added Medicine"
    when 5
      self.add_item(chocolate_bar)
      puts "You have added a Chocolate Bar"
    end
    add_another_item
  end

# add a product to the cart

  def add_item(item)
    @shopping_cart << item
    puts "you have just added an item"
  end

#function to add another item

  def add_another_item
    puts "Do you want to add another product? type Y for yes and N for no"
    add_another = gets.chomp
    if add_another == 'Y'
      pick_a_product
    else
      puts "This is your receipt"
      print_receipt
    end
  end

# function for printing the receipt

  def print_receipt
    @shopping_cart.each do |item|
      puts "1 #{item}"
      item.tax
    end
    puts "Total Taxes #{@@counter_tax}"
    puts "Total Balance #{@@counter_total}"
  end
end


# all the products

book = Item.new('Book', 12.49, true, false)
food = Item.new('Food', 10.99, true, false)
music_cd = Item.new('Music cd', 14.99, false, true)
medicine = Item.new("Medicine", 32.60, false, false)
chocolate_bar = Item.new('Chocolate Bar', 0.85, true, true)

# all the receipts

receipt1 = Receipt.new

# how the program runs

receipt1.pick_a_product
#receipt1.print_receipt
