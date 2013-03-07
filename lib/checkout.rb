require_relative 'item_list.rb'

class Rules
  include ItemList
  
  def apply_rules(basket)
    count = 0
    total = 0
    basket.each do |item|
      if item == '001'
        count = count + 1
      end
     end
    if count >= 2
      @@ITEMS_LIST['001'] = 8.50
    else
      @@ITEMS_LIST['001'] = 9.25
    end  
    basket.each do |item|
      total = total + @@ITEMS_LIST[item]
    end
    if total > 60
      total -=  total * 0.10
    end
    return total.round(2)
  end
end
class Checkout
  include ItemList

  def initialize(promotional_rules)
    @promotional_rules = promotional_rules
    @basket = []
  end


  def scan(item)
    if @@ITEMS_LIST.include? item 
      @basket << item
    end
  end

  def clear
    @basket.clear
  end  
    
 
 def total
   puts "\nBasket: #{@basket.join(",")}"
   return @promotional_rules.apply_rules(@basket)
 end  
end
promotional_rules = Rules.new
co = Checkout.new(promotional_rules)
co.scan('001')
co.scan('002')
co.scan ('003')
puts "Total Price Expected: #{co.total}"
co.clear
co.scan('001')
co.scan('003')
co.scan('001')
puts "Total Price Expected: #{co.total}"
co.clear
co.scan('001')
co.scan('002')
co.scan('001')
co.scan('003')
puts "Total Price Expected: #{co.total}"

