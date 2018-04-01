class ApplicationController < ActionController::API
  protect_from_forgery with: :exception
  include SessionsHelper

  private
    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def logged_in_admin
      unless logged_in?
        unless current_user.admin?
          flash[:danger] = "Private information"
          redirect_to root_url
        end
      end
    end

end
