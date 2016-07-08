class InvitesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, except: [:index, :edit, :update, :destroy]
  before_action :set_invite, only: [:show, :edit, :update, :destroy]



  def index
    @user = current_user
    @invites = @user.invites
  end

  def new
    @users = User.all
  end

  def create
    invites = []
    params[:user_ids].each do |user_id, value|
      invites << (@event.invites.build(user_id: user_id)) if value == "1"
    end
    if invites.any? { |invite| invite.invalid? }
      render :new
    else
      invites.each { |invite| invite.save }
      i_l = invites.length 
      flash[:success] = "#{i_l} " + "invite".pluralize(i_l) + " sent!"
      redirect_to @event
    end
  end

  def edit
    @user = User.find_by(id: params[:user_id])
    @invite = Invite.find_by(id: params[:id])
    @event = @invite.event
  end

  def update
    @user = User.find_by(id: params[:user_id])
    @invite = Invite.find_by(id: params[:id])
    if @invite.update_attributes(update_invite_params)
      flash[:success] = "Reply updated!"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    # Invite found by host_or_guest_user before filter.
    @invite.destroy
    flash[:success] = "Invite canceled"
    redirect_to request.referrer || root_url
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_invite
      @invite = Invite.find(params[:id])
    end

    def set_event
      @event = Event.friendly.find(params[:event_id])
    end

    def update_invite_params
      params.require(:invite).permit(:status)
    end
end
