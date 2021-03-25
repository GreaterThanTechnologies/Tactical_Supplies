class ApplicationController < ActionController::Base

  helper_method(:current_user)

  def current_user
    @current_owner = Owner.find_by(id: session[:owner_id])
  end
end