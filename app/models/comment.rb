class Comment < ApplicationRecord
  belongs_to :entry

  def as_json(options={})
    opts ={:only => [:id, :author, :comment, :created_at]}
    super (options.merge(opts))
  end
end
