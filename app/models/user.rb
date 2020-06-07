class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :omniauthable, omniauth_providers: [:facebook, :twitter, :google_oauth2]
  has_many :set_lists, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX, message: "を○○@○○.○○の形式で入力して下さい" }, length: { maximum: 255 }
  validates :nickname, presence: true, length: { in: 1..10 }
  VALID_PASSWORD_REGEX = /\A(?=.*[a-z])(?=.*\d)[a-z\d]{8,}+\z/
  validates :password, presence: true, length: { maximum: 75 }, format: { with: VALID_PASSWORD_REGEX, message: "を半角英数字8文字以上で入力して下さい" }

  # self.~~:クラスメソッド(クラス内のどこでも使える変数)
  def self.find_for_oauth(auth)
    # usersテーブルの中から指定したuidとproviderの組み合わせを持つユーザーを探す
    user = User.find_by(uid: auth.uid, provider: auth.provider)
    
    # 変数の中身がnilの場合、右辺のメソッドを実行する
    user ||= User.create!(
      uid: auth.uid,
      provider: auth.provider,
      # 下で定義するメソッドを使い、一意のメールアドレスを作成
      email: User.dummy_email(auth),
      # Devise.friendly_token:ランダムな20桁の数字を作成
      password: Devise.friendly_token[0, 20]
    )
    # 返り値としてuserを返す
    return user
  end
  
  def self.dummy_email(auth)
    "#{Time.now.strftime('%Y%m%d%H%M%S').to_i}-#{auth.uid}-#{auth.provider}@example.com"
  end
  
end
