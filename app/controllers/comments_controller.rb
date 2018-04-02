class CommentsController < ApplicationController
  before_action :set_headers

  def index
    entry = Entry.find(params[:entry_id])
    comments = entry.comments.order('created_at DESC');
    render json: comments, status: :ok
  end

  def show
    entry = Entry.find(params[:entry_id])
    comment = entry.comments.find(params[:id])
    render json: comment, status: :ok
  end

  def create
    entry = Entry.find(params[:entry_id])
    comment = entry.comments.new(comment_params)
    if comment.save
      render json: comment, status: :created
    else
      render json: comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    entry = Entry.find(params[:entry_id])
    comment = entry.comments.find(params[:id])
    comment.destroy
    render json: comment, status: :ok
  end

  def update
    entry = Entry.find(params[:entry_id])
    comment = entry.comments.find(params[:id])
    if comment.update_attributes(comment_params)
      render json: comment, status: :ok
    else
      render json: comment.errors, status: :unprocessable_entity
    end
  end

  private
  def comment_params
    params.permit(:author, :comment)
  end

  def set_headers
    response.headers["Content-Type"] = "application/json"
  end

end
