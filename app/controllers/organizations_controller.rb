class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  # GET /organizations
  # GET /organizations.json
  def index
    @organizations = Organization.all
  end

  # GET /organizations/1
  # GET /organizations/1.json
  def show
    @membership = Membership.includes(:user).where(organization_id: params[:id])
    @events = Event.where(organization_id: params[:id])
  end

  # GET /organizations/new
  def new
    @organization = Organization.new
  end

  # GET /organizations/1/edit
  def edit
  end

  # POST /organizations
  # POST /organizations.json
  def create
    @organization = Organization.new(organization_params)

    respond_to do |format|
      if @organization.save
        flash[:notice] = "Organization was successfully created."
        @member = Membership.create(owner:true,organization_id:@organization.id,user_id:@current_user.id)
        @member.save
        format.html { redirect_to @organization}#, notice: 'Organization was successfully created.' }
        format.json { render :show, status: :created, location: @organization }
      else
        flash[:alert] = "Uups! An error ocurred. Try again later"
        format.html { render :new }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organizations/1
  # PATCH/PUT /organizations/1.json
  def update
    respond_to do |format|
      if @organization.update(organization_params)
        flash[:notice] = "Organization was successfully updated."
        format.html { redirect_to @organization}#, notice: 'Organization was successfully updated.' }
        format.json { render :show, status: :ok, location: @organization }
      else
        flash[:alert] = "Uups! An error ocurred. Try again later"
        format.html { render :edit }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    @organization.destroy
    respond_to do |format|
      flash[:notice] = "Organization was successfully destroyed."
      format.html { redirect_to root_path, notice: 'Organization was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def organization_params
      params.fetch(:organization, {}).permit(:name,:description,:flyer,:id)
    end
end
