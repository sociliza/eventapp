class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.date :date_of_birth
      t.string :contact_number
      t.text :interest
      t.text :favourite_quote
      t.text :about_me
      t.string :image
      
      t.references :profileable, polymorphic: true

      t.timestamps
    end
  end
end
