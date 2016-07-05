class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.references :business, foreign_key: true
      t.references :category, foreign_key: true
      t.string :title
      t.datetime :start_date
      t.datetime :end_date
      t.text :description
      t.string :image
      t.string :slug
      
      t.timestamps
    end
    add_index :events, :slug
  end
end
