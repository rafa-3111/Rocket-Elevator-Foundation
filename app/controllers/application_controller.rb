class ApplicationController < ActionController::Base

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, notice: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end


  rescue_from ActionController::InvalidAuthenticityToken, with: :redirect_and_prompt_for_sign_in

  protected

    def redirect_and_prompt_for_sign_in
      redirect_to(new_user_session_path, alert: 'Please sign in.')
    end

  private

    def after_sign_out_path_for(resource)
      new_user_session_path
    end


  skip_before_action :verify_authenticity_token
  def after_sign_in_path_for(resource)
    if current_user.is_admin?
      rails_admin_path
    else
      new_quote_path
    end
  end  
end