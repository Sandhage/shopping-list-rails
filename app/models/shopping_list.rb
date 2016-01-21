class ShoppingList < ActiveRecord::Base
    has_many :items
end
