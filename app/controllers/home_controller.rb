class HomeController < ApplicationController
  def top
    @user = current_user if user_signed_in?
  end
end
