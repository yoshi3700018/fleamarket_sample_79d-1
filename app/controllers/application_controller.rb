class ApplicationController < ActionController::Base
  # Basic認証の設定（本番環境）
  before_action :basic_auth, if: :production?
  # ログイン済みユーザーのみにアクセスを許可(サインインが面倒なため常時コメントアウト)
  before_action :authenticate_user!

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