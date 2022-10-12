require 'pry'

class CashRegister

    attr_accessor :total, :items, :last_transaction
    attr_reader :discount

    def initialize(discount = 0)
        @discount = discount
        @total = 0.0
        @items = []
    end

    def add_item(item, price, quantity = 1)
        quantity.times do
            self.items << item
        end
        self.last_transaction = price * quantity
        self.total += last_transaction
    end

    def apply_discount
        if self.discount != 0
            self.total =  (self.total * (100-self.discount)/100).to_i
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end 
    end

    def void_last_transaction
        self.total -= self.last_transaction
    end

    
end

c = CashRegister.new(20)
c.add_item("macbook air", 1000)
puts c.apply_discount
