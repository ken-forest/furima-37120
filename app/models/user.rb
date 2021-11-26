class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :items
  has_many :purchase_records

  validates :nickname, presence: true
  validates :last_name, presence: true, format:{with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :first_name, presence: true, format:{with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :last_name_kana, presence: true, format:{with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana, presence: true, format:{with: /\A[ァ-ヶー－]+\z/ }
  validates :birth_date, presence: true

  validates :password, format:{with: /\A(?=.*?[a-z])(?=.*?[\d])\w{6,}\z/ }
  
end
