class ApplicationController < ActionController::Base

  include Pundit::Authorization

  before_action :set_current_request_details
  before_action :authenticate
  helper_method :current_user

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private
    def authenticate
      # CHeck if user is verified?

      if session_record = Session.find_by_id(cookies.signed[:session_token])
        if session_record.user.verified
          Current.session = session_record
        else
          cookies.delete(:session_token)
          redirect_to sign_in_path, notice: "Your account needs to be verified"
        end
      else
        redirect_to sign_in_path
      end
    end

    def set_current_request_details
      Current.user_agent = request.user_agent
      Current.ip_address = request.ip
    end

    def current_user
      @current_user = Current.user
    end

    def user_not_authorized(exception)
      flash[:alert] = "You are not authorize create any user"
      redirect_back(fallback_location: new_invitation_path)
    end
end
