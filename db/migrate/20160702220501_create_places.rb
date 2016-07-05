class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :title
      t.string :street
      t.string :city
      t.string :state
      t.string :country
      t.string :zipcode
      t.float :latitude
      t.float :longitude
      t.references :placeable, polymorphic: true

      t.timestamps
    end
  end
end
