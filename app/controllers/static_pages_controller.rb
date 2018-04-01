class StaticPagesController < ApplicationController
  def home
    @entries = Entry.all
  end

  def about
  end

  def administrator
    @entry = current_user.entries.build if logged_in?
    @entries = Entry.all
  end

end
