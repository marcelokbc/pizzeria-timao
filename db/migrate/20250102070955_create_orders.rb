class CreateOrders < ActiveRecord::Migration[7.2]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :table, null: false, foreign_key: true
      t.integer :status
      t.decimal :total_price

      t.timestamps
    end
  end
end
