class HomeController < ApplicationController
  def top
    @user = current_user if user_signed_in?
    @books = Book.all
  end

  def about

  end
end
