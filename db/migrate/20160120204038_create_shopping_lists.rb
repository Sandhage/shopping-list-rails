class CreateShoppingLists < ActiveRecord::Migration
  def change
    create_table :shopping_lists do |t|
      t.string :name, limit: 20, default: '', null: false
      t.string :description, default: ''
      
      t.timestamps null: false
    end
  end
end
