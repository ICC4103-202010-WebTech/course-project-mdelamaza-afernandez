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
    end
  end
end

