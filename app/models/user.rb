class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  has_one :postal
  has_many :product
  
  validates :nickname, :first_name, :family_name, :birthday, presence: true
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, 
            format: { with: VALID_EMAIL_REGEX }


  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{7,12}\z/
  validates :password, presence: true,
            format: { with: VALID_PASSWORD_REGEX,
            message: "は半角6~12文字英大文字・小文字・数字それぞれ１文字以上含む必要があります"}

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


end
