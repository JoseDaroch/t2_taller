class Entry < ApplicationRecord
  has_many :comments, dependent: :destroy

  default_scope -> { order(created_at: :desc) }

  validates :titulo, presence: true
  validates :bajada, length: { maximum: 200 }
  validates :cuerpo, presence: true
end
