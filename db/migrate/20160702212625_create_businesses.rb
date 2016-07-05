class CreateBusinesses < ActiveRecord::Migration[5.0]
  def change
    create_table :businesses do |t|
      t.string :company_name
      t.string :slug

      t.timestamps
    end
    add_index :businesses, :slug
  end
end
