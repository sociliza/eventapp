module ApplicationHelper
  
  def plan_name(plan_id)
  	plan_name = Plan.where(id: plan_id).pluck(:name).first
  end

  def page_header(text)
  	content_for(:page_header) {text.to_s}
  end
end
