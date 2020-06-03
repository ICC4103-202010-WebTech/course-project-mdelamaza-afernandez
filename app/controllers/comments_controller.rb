class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.where(event_id: params[:event_id])
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
        if @comment.save
          flash[:notice] = "Comment Has Been Created!"
          format.html { redirect_to @comment} #,notice: 'Comment was successfully created.' }
          format.json { render :show, status: :created, location: @comment }
        else
          flash[:alert] = "Uups! An error ocurred. Try again later"
          format.html { render :new }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        flash[:notice] = "Comment Has Been Updated!"
        format.html { redirect_to @comment} #,notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        flash[:alert] = "Uups! An error ocurred. Try again later"
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      flash[:notice] = "Comment Has Been destroyed!"
      format.html { redirect_to comments_url}#, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.fetch(:comment, {}).permit(:id,:msg,:user_id,:event_id)
    end
end
