# class PagesController < ApplicationController
#   def home
#     @events = Event.all
#   end
#   def search
#     if params[:search].blank?
#       flash[:notice] = "Empty Search"
#       redirect_back(fallback_location: root_path)
#     else
#       puts("Search has been succesfull")
#       @parameter = params[:search].downcase
#       @matchUser =  User.all.where("lower(user_name) LIKE?", "%#{@parameter}%")
#       @matchEvent = Event.where("lower(name) LIKE ?", "%#{@parameter}%" )
#       @matchOrganization = Organization.where("lower(name) LIKE ?","%#{@parameter}%")
#     end
#   end
# end
#



class PagesController < ApplicationController
  def home
    @events = Event.all
  end
  def search
    if params[:search].blank?
      flash[:notice] = "Empty Search"
      redirect_back(fallback_location: root_path)
    else
      puts("Search has been succesfull")
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


      # @matchCreator = Event.where("id = ?",@matchGuest.event_id)
    end
  end
end
