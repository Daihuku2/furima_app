class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do

    @zennkaku_kanji = /\A[ぁ-んァ-ン一-龥]+\z/
    @zennkaku_kana  = /\A[ァ-ヶー－]+\z/

    validates :nickname     
    validates :email,                 format: { with: /@.+/ }
    validates :password,              format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
    validates :family_name_kanji,     format: { with: @zennkaku_kanji}
    validates :first_name_kanji,      format: { with: @zennkaku_kanji}
    validates :family_name_kana,      format: { with: @zennkaku_kana}
    validates :first_name_kana,       format: { with: @zennkaku_kana}
    validates :birthday
  end
end
