class MultimediaController < ApplicationController
  before_action :set_multimedium, only: [:show, :edit, :update, :destroy]

  # GET /multimedia
  # GET /multimedia.json
  def index
    @multimedia = Multimedium.all
  end

  # GET /multimedia/1
  # GET /multimedia/1.json
  def show
  end

  # GET /multimedia/new
  def new
    @multimedium = Multimedium.new
  end

  # GET /multimedia/1/edit
  def edit
  end

  # POST /multimedia
  # POST /multimedia.json
  def create
    @multimedium = Multimedium.new(multimedium_params)

    respond_to do |format|
      if @multimedium.save
        flash[:notice] = "Multimedium was successfully created."
        format.html { redirect_to @multimedium}#, notice: 'Multimedium was successfully created.' }
        format.json { render :show, status: :created, location: @multimedium }
      else
        flash[:alert] = "Uups! An error ocurred. Try again later"
        format.html { render :new }
        format.json { render json: @multimedium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /multimedia/1
  # PATCH/PUT /multimedia/1.json
  def update
    respond_to do |format|
      if @multimedium.update(multimedium_params)
        flash[:notice] = "Multimedium was successfully updated."
        format.html { redirect_to @multimedium}#, notice: 'Multimedium was successfully updated.' }
        format.json { render :show, status: :ok, location: @multimedium }
      else
        flash[:alert] = "Uups! An error ocurred. Try again later"
        format.html { render :edit }
        format.json { render json: @multimedium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /multimedia/1
  # DELETE /multimedia/1.json
  def destroy
    @multimedium.destroy
    respond_to do |format|
      flash[:notice] = "Multimedium was successfully destroyed."
      format.html { redirect_to multimedia_url}#, notice: 'Multimedium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_multimedium
      @multimedium = Multimedium.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def multimedium_params
      params.fetch(:multimedium, {})
    end
end
