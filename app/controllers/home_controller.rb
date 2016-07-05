class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
  	@plans = Plan.all.to_a
  end
end
