class Entry < ApplicationRecord
  has_many :comments, dependent: :destroy

  default_scope -> { order(created_at: :desc) }

  validates :title, presence: true
  validates :subtitle, length: { maximum: 200 }
  validates :body, presence: true
end
