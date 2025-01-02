class CreateTables < ActiveRecord::Migration[7.2]
  def change
    create_table :tables do |t|
      t.integer :number
      t.integer :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
