class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)
    if @user.persisted?
      sign_in(@user, event: :authentication)
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
      redirect_to session.has_key?(:return_url) ? session.delete(:return_url) : root_path
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end