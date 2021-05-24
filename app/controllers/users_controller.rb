class UsersController < ApplicationController
  before_action :authenticate_user!
  def new
    @user = User.new
  end

  def index
    @book = Book.new
    @users = User.all
    @user = current_user
  end

  def create
    @user = User.new(user_params)
    @user.user.id = current_user.id
    @user.save
    redirect_to user_path
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @users = User.all
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])

  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id)
    else
      render 'edit'
    end

  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end

end
