class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  #before_action :login_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :kana_first, 
      :kana_last, :nickname, :prefecture_id, :age_id, :gender_id])
  end

  #def login_permitted_parameters
    #devise_parameter_sanitizer.permit(:sign_in, keys: [:nickname])
  #end
end
