module ApplicationHelper
  
  def plan_name(plan_id)
  	plan_name = Plan.where(id: plan_id).pluck(:name).first
  end
end
