class ApplicationController < ActionController::Base
  # Basic認証の設定（本番環境）
  before_action :basic_auth, if: :production?
  # deviseコントローラー使用時に呼び出す
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, 
                                                      :family_name,
                                                      :first_name,
                                                      :family_name_kana,
                                                      :first_name_kana,
                                                      :birthday,
                                                      :profile
    ])
  end
  
  private
  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end

end