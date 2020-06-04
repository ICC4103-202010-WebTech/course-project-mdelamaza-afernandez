class MembershipsController < ApplicationController
  before_action :set_membership, only: [:show, :edit, :update, :destroy]

  # GET /memberships
  # GET /memberships.json
  def index
    @memberships = Membership.includes(:organization).where(user_id: params[:user_id])
  end

  # GET /memberships/1
  # GET /memberships/1.json
  def show
    @membership = Membership.includes(:user).where(organization_id: params[:organization_id])
  end

  # GET /memberships/new
  def new
    @organization = params[:organization_id]
    @membership = Membership.new
  end

  # GET /memberships/1/edit
  def edit
  end

  # POST /memberships
  # POST /memberships.json
  def create
    @membership = Membership.new(membership_params)

    respond_to do |format|
      if @membership.save!
        flash[:notice] = "Membership was successfully created."
        format.html { redirect_to root_path}#, notice: 'Membership was successfully created.' }
        format.json { render :show, status: :created, location: @membership }
      else
        flash[:alert] = "Uups! An error ocurred. Try again later"
        format.html { render :new }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /memberships/1
  # PATCH/PUT /memberships/1.json
  def update
    respond_to do |format|
      if @membership.update(membership_params)
        flash[:notice] = "Membership was successfully updated."
        format.html { redirect_to @membership}#, notice: 'Membership was successfully updated.' }
        format.json { render :show, status: :ok, location: @membership }
      else
        flash[:alert] = "Uups! An error ocurred. Try again later"
        format.html { render :edit }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memberships/1
  # DELETE /memberships/1.json
  def destroy
    @membership.destroy
    respond_to do |format|
      flash[:notice] = "Membership was successfully destroyed."
      format.html { redirect_to memberships_url}#, notice: 'Membership was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_membership
    @membership = Membership.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def membership_params
    params.fetch(:membership, {}).permit(:user_id,:organization_id,:owner)
  end
end
