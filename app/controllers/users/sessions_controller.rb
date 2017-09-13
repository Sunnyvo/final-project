class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end
  # def callback
  #   if user = User.from_omniauth(request.env["omniauth.auth"])
  #     login(user)
  #     redirect_to root_path
  #     # redirect_to root_path, flash: {success: "Logged in!"}
  #     # log in user here
  #   else
  #     redirect_to root_path
  #     # don't log user in
  #   end
  # end

  # #DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
