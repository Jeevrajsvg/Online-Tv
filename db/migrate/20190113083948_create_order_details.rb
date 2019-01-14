class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.references :user, foreign_key: true
      t.references :order, polymorphic: true
      t.float :price
      t.string :quality

      t.timestamps
    end
  end
end
