class EventsController < ApplicationController
  before_action :authenticate_business!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  #before_action :set_business, only: [:new, :create, :edit, :update, :destroy]


  # GET /events
  # GET /events.json
  def index
    #user_ids = current_user.timeline_user_ids
    #show by location
    #visitor_latitude = request.location.latitude 
    #visitor_longitude = request.location.latitude
    #@events = Event.near([visitor_latitude, visitor_longitude], 20)

    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
    @event_place = @event.build_place

    @can_moderate = (current_business == @event.business)
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.business = current_business

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    redirect_to root_path if current_business != @event.business
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    @events = Event.search(params)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.friendly.find(params[:id])
    end

    def event_owner!
      if business_signed_in?
        if @event.business_id != current_user.id
          redirect_to event_path
          flash[:notice] = 'You do not have enough permissions to do this'
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :start_date, :end_date, :description, :image, :image_cache, :slug,
        place_attributes: [:street, :city, :state, :country, :zipcode])
    end
end
