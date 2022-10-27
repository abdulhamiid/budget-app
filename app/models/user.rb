class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_many :entities
  has_many :groups

  validates :name, presence: true, length: { maximum: 25 }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

end
