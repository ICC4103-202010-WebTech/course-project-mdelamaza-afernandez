class DateOptionsController < ApplicationController
  before_action :set_date_option, only: [:show, :edit, :update, :destroy]

  # GET /date_options
  # GET /date_options.json
  def index
    @date_options = DateOption.all
  end

  # GET /date_options/1
  # GET /date_options/1.json
  def show
  end

  # GET /date_options/new
  def new
    @date_option = DateOption.new
  end

  # GET /date_options/1/edit
  def edit
  end

  # POST /date_options
  # POST /date_options.json
  def create
    @date_option = DateOption.new(date_option_params)

    respond_to do |format|
      if @date_option.save
        format.html { redirect_to @date_option, notice: 'Date option was successfully created.' }
        format.json { render :show, status: :created, location: @date_option }
      else
        format.html { render :new }
        format.json { render json: @date_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /date_options/1
  # PATCH/PUT /date_options/1.json
  def update
    respond_to do |format|
      if @date_option.update(date_option_params)
        format.html { redirect_to @date_option, notice: 'Date option was successfully updated.' }
        format.json { render :show, status: :ok, location: @date_option }
      else
        format.html { render :edit }
        format.json { render json: @date_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /date_options/1
  # DELETE /date_options/1.json
  def destroy
    @date_option.destroy
    respond_to do |format|
      format.html { redirect_to date_options_url, notice: 'Date option was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_date_option
      @date_option = DateOption.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def date_option_params
      params.fetch(:date_option, {})
    end
end
