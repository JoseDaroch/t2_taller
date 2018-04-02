class Entry < ApplicationRecord
  has_many :comments, dependent: :destroy

  default_scope -> { order(created_at: :desc) }

  validates :title, presence: true
  validates :body, presence: true

  def as_json(options={})
    opts ={:only => [:id, :title, :subtitle, :body, :created_at]}
    super (options.merge(opts))
  end

end
