require_relative 'sales_taxes'
#receipt class
class Receipt
#total for the recepitp print
    @@counter_total = 0
    @@counter_tax = 0

  def initialize
    @price = 0
    @tax = 0
    #an array to keep the items
    @items = []
  end

#a ver como se usa esto

  def add_item(the_item_to_add)
    @items << the_item_to_add
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
end



book = Item.new('book', 10, true, false)

receipt.add_item(book)
