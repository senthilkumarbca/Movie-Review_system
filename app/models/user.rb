class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  # ******************** Associations ********************
  has_many :ratings, dependent: :destroy
  has_many :reviews, dependent: :destroy

  # ******************** Validations ********************
  validates :email, presence: true

end
