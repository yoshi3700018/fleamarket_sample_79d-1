class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable,
          :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  has_one :postal
  has_many :product
  has_many :sns_credential, dependent: :destroy
  
  validates :nickname, :first_name, :family_name, :birthday, presence: true
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, 
            format: { with: VALID_EMAIL_REGEX }


  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{8,30}\z/
  validates :password, presence: true,
            format: { with: VALID_PASSWORD_REGEX,
            message: "は半角8~30文字英大文字・小文字・数字それぞれ１文字以上含む必要があります"}

  validates :profile, length: { maximum: 300 }
  
  # " (全角スペース)"と"ー(長音)"は、\p{katakana}に含まれないため、付け足す!!
  VALID_KATAKANA_REGEX = /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/
  validates :first_name_kana, :family_name_kana, presence: true,
            format: { with: VALID_KATAKANA_REGEX,
            message: "はスペース、ーを含む全角カナで入力する必要があります"}
  
  VALID_NAME_REGEX = /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/
  validates :first_name_kana, :family_name_kana, presence: true,
            format: { with: VALID_NAME_REGEX,
            message: "は全角で入力する必要があります"}          

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_initialize
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = sns.user || User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
      email: auth.info.email
    )
    # userが登録済みの場合はそのままログインの処理へ行くので、ここでsnsのuser_idを更新しておく
    if user.persisted?
      sns.user = user
      sns.save(validate: false)
    end
    { user: user, sns: sns }
  end

  # comment機能のアソシエーション
  has_many :comments
  has_many :products

end
