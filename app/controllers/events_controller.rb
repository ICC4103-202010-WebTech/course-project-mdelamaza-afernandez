class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
     @events = Event.where(organization_id: params[:organization_id])
     # @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end
  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        flash[:notice] = "Event Has Been Created!"
        @guest = Guest.create(owner:true,event_id:@event.id,user_id:@current_user.id)
        @guest.save
        @fecha = DateOption.create(date: DateTime.now.to_date, event_id: @event.id )
        @fecha.save
        format.html { redirect_to @event}#, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        flash[:alert] = "Uups! An error ocurred. Try again later"
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        flash[:notice] = "Event Has Been Updated!"
        format.html { redirect_to @event}#, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        flash[:alert] = "Uups! An error ocurred. Try again later"
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
      flash[:notice] = "Event Has Been Destroyed!"
      format.html { redirect_to events_url}#, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.fetch(:event, {}).permit(:id, :name, :description, :location, :voted_date,:flyer,:organization_id,:private)
    end
end
