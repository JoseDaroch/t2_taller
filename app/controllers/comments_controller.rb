class CommentsController < ApplicationController
  def create
    @entry = Entry.find(params[:entry_id])
    @comment = @entry.comments.create(params[:comment].permit(:name, :body))
    redirect_to entry_path(@entry)
  end
end
