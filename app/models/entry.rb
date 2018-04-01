class Entry < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :titulo, presence: true
  validates :bajada, presence: true, length: { maximum: 200 }
  validates :cuerpo, presence: true
end
