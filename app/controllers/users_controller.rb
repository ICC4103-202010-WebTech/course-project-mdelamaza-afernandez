class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @guests = Guest.includes(:event).where(user_id: params[:id])
    @memberships = Membership.includes(:organization).where(user_id: params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        flash[:notice] = "User was successfully created."
        format.html { redirect_to @user}#, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        flash[:alert] = "Uups! An error ocurred. Try again later"
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        flash[:notice] = "User was successfully created."
        format.html { redirect_to root_path}#, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        flash[:alert] = "Uups! An error ocurred. Try again later"
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    a=false
    @guests = Guest.includes(:event).where(user_id: @user.id).where(owner: true)
    @memberships = Membership.includes(:organization).where(user_id: @user.id).where(owner: true)
    if @guests.first!=nil
      @guests.first.event.destroy
      a=true
    end
    if @memberships.first!=nil
      @memberships.first.organization.destroy
      a=true
    end
    @user.destroy
    respond_to do |format|
      flash[:notice] = "User was successfully created."
      if a
        format.html { redirect_to admin_path}#, notice: 'User was successfully destroyed.' }
      else
        format.html { redirect_to root_path}#, notice: 'User was successfully destroyed.' }
      end
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.fetch(:user, {}).permit(:email,:user_name,:password,:location,:description,:flyer,:id,:Admin)
    end
end
