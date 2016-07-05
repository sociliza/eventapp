class CreatePlans < ActiveRecord::Migration[5.0]
  def change
    create_table :plans do |t|
      t.string :name
      t.integer :events
      t.float :price
      t.integer :tables
      t.integer :storage

      t.timestamps
    end
  end
end
