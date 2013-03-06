require_relative 'item_list'

class Rules
  include ItemList

  @count = 0
  @total = 0
  def apply_rules(basket)
    @basket.each do |item|
      if item == '001'
        count = count + 1
      end
     end
    if count >= 2
      @@ITEM_LIST['001'] = 8.5
    end
    @basket.each do |item|
      @total = @total + @@ITEM_LIST[item]
    end
    if @total > 60
      @total -= @total * 0.10
    end
    return @total
  end
end
class Checkout

  def initialize(promotional_rules)
    @promotional_rules = promotional_rules
    @basket = []
  end


  def scan(item)
    if @@ITEMS_LIST.include? item 
      @basket << item
    end  
  end
 
 def total
   @promotional_rules.apply_rules(@basket)
 end  
end
promotional_rules = Rules.new
co = Checkout.new(promotional_rules)
co.scan(1)
co.scan(2)
