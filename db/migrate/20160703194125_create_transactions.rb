class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.references :business, foreign_key: true
      t.boolean :status
      t.decimal :amount, precision: 10, scale: 0
      t.string :company_name

      t.timestamps
    end
  end
end
