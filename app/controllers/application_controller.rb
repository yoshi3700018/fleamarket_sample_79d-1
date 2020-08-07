class ApplicationController < ActionController::Base
  # Basic認証の設定（本番環境）
  before_action :basic_auth, if: :production?
  # deviseコントローラー使用時に呼び出す
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_category

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

  # デフォルトで設定するセレクトドロップダウンリストに入れる値(親要素の値)を定義
  def set_category
    @category_level1 = Category.where(ancestry: nil)
  end
  # 子供のカテゴリーを設定、親の名称で検索 => 紐づいた配列を取得
  # コントロール自体はJSONで行う
  def set_category_level2
    @category_level2 = Category.find(params[:level1_id]).children
  end
  # 孫のカテゴリーを設定
  def set_category_level3
    @category_level3 = Category.find("#{params[:level2_id]}").children
  end

end