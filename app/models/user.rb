class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
          
   has_many :items
         
   with_options presence: true do
    validates :nickname, :birthday, :password_confirmation
    validates :first_name, :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]/, message: "は全角ひらがな、全角カタカナ、漢字で入力して下さい" }
    validates :last_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい" }
  end
    validates :password, :password_confirmation,
    format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "には英字と数字の両方を含めて入力してください" }
end   
