class MailBoxesController < ApplicationController
  before_action :set_mail_box, only: [:show, :edit, :update, :destroy]

  # GET /mail_boxes
  # GET /mail_boxes.json
  def index
    #@mail_boxes = MailBox.all
    @mail_boxes = MailBox.where(user_id: params[:user_id])
  end

  # GET /mail_boxes/1
  # GET /mail_boxes/1.json
  def show
  end

  # GET /mail_boxes/new
  def new
    @mail_box = MailBox.new
  end

  # GET /mail_boxes/1/edit
  def edit
  end

  # POST /mail_boxes
  # POST /mail_boxes.json
  def create
    @mail_box = MailBox.new(mail_box_params)

    respond_to do |format|
      if @mail_box.save
        format.html { redirect_to @mail_box, notice: 'Mail box was successfully created.' }
        format.json { render :show, status: :created, location: @mail_box }
      else
        format.html { render :new }
        format.json { render json: @mail_box.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mail_boxes/1
  # PATCH/PUT /mail_boxes/1.json
  def update
    respond_to do |format|
      if @mail_box.update(mail_box_params)
        format.html { redirect_to @mail_box, notice: 'Mail box was successfully updated.' }
        format.json { render :show, status: :ok, location: @mail_box }
      else
        format.html { render :edit }
        format.json { render json: @mail_box.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mail_boxes/1
  # DELETE /mail_boxes/1.json
  def destroy
    @mail_box.destroy
    respond_to do |format|
      format.html { redirect_to mail_boxes_url, notice: 'Mail box was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mail_box
      @mail_box = MailBox.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mail_box_params
      params.fetch(:mail_box, {})
    end
end
