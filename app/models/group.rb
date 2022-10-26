class Group < ApplicationRecord
  belongs_to :user

  has_many :entities, dependent: :destroy
  has_one_attached :icon

  def recent_transactions
    entities.order('created_at Desc')
  end
end
