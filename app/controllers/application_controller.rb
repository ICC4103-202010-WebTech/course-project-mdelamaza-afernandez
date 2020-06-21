class ApplicationController < ActionController::Base
  before_action :set_user



  def set_user
     @current_user = current_user
  end
end