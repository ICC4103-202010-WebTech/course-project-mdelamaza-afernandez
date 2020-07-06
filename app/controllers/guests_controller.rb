class GuestsController < ApplicationController
  # load_and_authorize_resource
  before_action :set_guest, only: [ :edit, :update, :destroy]

  # GET /guests
  # GET /guests.json
  def index
    @guests = Guest.includes(:event).where(user_id: params[:user_id])
  end

  # GET /guests/1
  # GET /guests/1.json
  def show
    @guest = Guest.includes(:user).where(event_id: params[:event_id])

  end

  # GET /guests/new
  def new

    @event = params[:event_id]
    @guest = Guest.new
  end

  # GET /guests/1/edit
  def edit
  end

  # POST /guests
  # POST /guests.json
  def create
    @guest = Guest.new(guest_params)
    # @event = Event.where(id: params[:event_id])
    # puts ("chaooooooooooooooooooooooooo")
    # puts(params[:id])
    respond_to do |format|
      if @guest.save
        flash[:notice] = "Guest Has Been Created!"
        format.html { redirect_to Event.where(id: @guest.event_id).first, notice: 'Guest was successfully created.' }
        format.json { render :show, status: :created, location: @guest }
      else
        flash[:alert] = "The User is alredy invite"
        format.html { redirect_to Event.where(id: @guest.event_id).first }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guests/1
  # PATCH/PUT /guests/1.json
  def update
    respond_to do |format|
      if @guest.update(guest_params)
        flash[:notice] = "Guest Has Been Updated!"
        format.html { redirect_to @guest}#, notice: 'Guest was successfully updated.' }
        format.json { render :show, status: :ok, location: @guest }
      else
        flash[:alert] = "Uups! An error ocurred. Try again later"
        format.html { render :edit }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guests/1
  # DELETE /guests/1.json
  def destroy
    if @guest.owner
      Event.where(id: @guest.event_id).first.destroy
    else
    @guest.destroy
    end
    respond_to do |format|
      flash[:notice] = "Guest Has Been Destroyed!"
      if Event.where(id: @guest.event_id).first!=nil
      format.html { redirect_to Event.where(id: @guest.event_id).first}#, notice: 'Guest was successfully destroyed.' }
      else
        format.html { redirect_to root_path }
        end
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_guest
    @guest = Guest.find(params[:id])
  end


  # Only allow a list of trusted parameters through.
  def guest_params
    params.fetch(:guest, {}).permit(:user_id,:event_id,:owner)
  end
end