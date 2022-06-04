require "pry"
class CashRegister
    attr_accessor :total, :last
    attr_reader :discount, :items

    def initialize employee_discount=0
        @total = 0
        @discount = employee_discount
        @items = []
        @last = 0
    end

    def add_item title, price, quantity=1
        self.total += price * quantity
        quantity.times do 
            self.items << title
        end
        self.last = price * quantity
    end

    def apply_discount
        self.total = self.total - (self.discount.to_f / 100) * self.total
        
        if (discount == 0)
            "There is no discount to apply."
        else
            "After the discount, the total comes to $#{self.total.to_i}."  
        end
    end

    def void_last_transaction
  
        self.total -= self.last
    end

end
