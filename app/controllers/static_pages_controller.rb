class StaticPagesController < ApplicationController
  def home
  end

  def delete_all_users
    User.delete_all
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'All users were successfully deleted.' }
    end
  end
end
