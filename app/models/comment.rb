class Comment < ApplicationRecord
  belongs_to :entry

  attr_readonly :id
  attr_readonly :created_at

  def as_json(options={})
    opts ={:only => [:id, :title, :subtitle, :body, :created_at]}
    super (options.merge(opts))
  end
end
