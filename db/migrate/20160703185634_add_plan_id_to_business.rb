class AddPlanIdToBusiness < ActiveRecord::Migration[5.0]
  def change
    add_reference :businesses, :plan, foreign_key: true
  end
end
