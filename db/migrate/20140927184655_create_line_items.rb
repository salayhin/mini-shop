class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :cart_id
      t.integer :product_id
      t.integer :quantity
      t.float :product_price

      t.timestamps
    end
  end
end
