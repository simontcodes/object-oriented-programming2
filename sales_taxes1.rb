require_relative 'sales_taxes'
#receipt class
class Receipt
#total for the recepitp print
    @@counter_total = 0
    @@counter_tax = 0

  def initialize
    @price = 0
  end

  def tax(item)
    @price = item.price
    @price = @price + (@price * 0.10)
    import_tax
  end

  def import_tax(item)
    imported = item.imported
    if imported == true
      @price = @price + (@price *0.05)
    end
    
  end
  def add_to_total
    @@counter_total = @@counter_total + @price

  end
end



book = Item.new('book', 10, true)
