require_relative 'item'
#receipt class

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
    @item_to_add = 0
  end

#a ver como se usa esto

  def add_item(item_to_add)
    @shopping_cart << @item_to_add
  end
#calcula el tax
  def tax(item)
    free = item.free_of_tax
    if free == false
    @price = item.price
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
      @price = @price + (@price *0.05)
    end
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
    @item_to_add = gets.chomp
    case @item_to_add
    when 1
      add_item(Book)
    when 2
      add_item(Food)
    when 3
      add_item(Music_cd)
    when 4
      add_item(Medicine)
    when 5
      add_item(Chocolate_bar)
    end
    add_another_item
  end
#function to add another item

  def add_another_item
    puts "Do you want to add another product? type Y for yes and N for no"
    add_another = gets.chomp
    if add_another == 'Y'
      pick_a_product
    else
      puts "This is your receipt"
  end

# function for printing the receipt

  def print_receipt

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
receipt1.
receipt1.print_receipt
