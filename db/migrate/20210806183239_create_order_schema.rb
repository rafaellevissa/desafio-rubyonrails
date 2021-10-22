class CreateOrderSchema < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :model
      t.string :imei
      t.float :value
      t.integer :installments
      t.bigint :user_id
      t.timestamps
    end

    add_foreign_key :orders, :users
  end
end
