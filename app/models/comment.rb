class Comment < ApplicationRecord
  belongs_to :entry

  def as_json(options={})
    opts ={:only => [:id, :title, :subtitle, :body, :created_at]}
    super (options.merge(opts))
  end
end
