class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :nickname, presence: true
  validates :last_name, presence: true, format:{with: /\A[一-龥ぁ-ん]\z/ }
  validates :first_name, presence: true, format:{with: /\A[一-龥ぁ-ん]\z/ }
  validates :last_name_kana, presence: true, format:{with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana, presence: true, format:{with: /\A[ァ-ヶー－]+\z/ }
  validates :birth_date, presence: true

  validates :password, format:{with: /\A[a-z\d]{6,}\z/ }
  
end
