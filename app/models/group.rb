class Group < ApplicationRecord
  belongs_to :user

  has_many :entities, dependent: :destroy
  has_one_attached :icon

  validates :name, presence: true, length: { maximum: 25 }
  validates :icon, presence: true

  def recent_transactions
    entities.order('created_at Desc')
  end
end
