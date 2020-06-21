class PagesController < ApplicationController
  before_action :authenticate_user!
  def home
    if user_signed_in?
      @events = Event.all
    else
      redirect_to new_user_session_path
    end
  end
  def search
    if params[:search].blank?
      flash[:alert] = "Empty Field"
      redirect_to controller: "pages", action: "home"
    else

      @parameter = params[:search].downcase
      @matchUser =  User.all.where("lower(user_name) LIKE?", "%#{@parameter}%")

      @matchEvent = Event.where("lower(name) LIKE ?", "%#{@parameter}%" )
      @matchOrganization = Organization.where("lower(name) LIKE ?","%#{@parameter}%")
      @matchId = User.all.where("lower(user_name) LIKE?", "%#{@parameter}%")
      #1,2,4
      # @matchId.ids.each do |id|
      #   @matchGuest = Guest.all.where("user_id =? and owner = ?", id, true)
      #   puts id
      #   puts "ID EVENTO"
      # end
      flash[:notice] = "Search has been done succesfully"

      # @matchCreator = Event.where("id = ?",@matchGuest.event_id)
    end
  end
end

