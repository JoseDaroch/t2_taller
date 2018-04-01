class EntriesController < ApplicationController
  before_action :logged_in_admin, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def show
    @entry = Entry.find(params[:id])
    @comments = @entry.comments.all
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = current_user.entries.new(entry_params)
    if @entry.save
      flash[:success] = "Entry created!"
      redirect_to root_url
    else
      @feed_items = []
      redirect_to root_url
    end
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def update
    @entry = Entry.find(params[:id])
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @entry.destroy
    flash[:success] = "Entry deleted"
    redirect_to root_url
  end

  private

    def entry_params
      params.require(:entry).permit(:titulo, :bajada, :cuerpo)
    end

    def correct_user
      @entry = current_user.entries.find_by(id: params[:id])
      redirect_to root_url if @entry.nil?
    end
end
