class ApplicationController < ActionController::Base
  before_action :set_customer

  private

  def set_customer
    @users = User.first
  end
end
