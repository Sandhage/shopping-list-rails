class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string  :name, limit: 20, default: '', null: false
      t.string  :description, default: ''
      t.integer :quantity, default: 0, null: false
      t.integer :shopping_list_id
      
      t.timestamps null: false
    end
  end
end
