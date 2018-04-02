class EntriesController < ApplicationController
  def index
    entries = Entry.order('created_at DESC');
    render json: entries, status: :ok
  end

  def show
    entry = Entry.find(params[:id])
    render json: entry, status: :ok
  end

  def create
    entry = Entry.new(entry_params)
    if entry.save
      render json: entry, status: :created
    else
      render json: entry.errors, status: :unprocessable_entity
    end
  end

  def destroy
    entry = Entry.find(params[:id])
    entry.destroy
    render json: entry, status: :ok
  end

  def update
    entry = Entry.find(params[:id])
    if entry.update_attributes(entry_params)
      render json: entry, status: :ok
    else
      render json: entry.errors, status: :unprocessable_entity
    end
  end


  private
  def entry_params
    params.permit(:title, :subtitle, :body)
  end
end
