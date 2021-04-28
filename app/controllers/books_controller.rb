class BooksController < ApplicationController
  def new
    @book = Book.new

  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @review = Review.new
    @reviews = Review.where(book_id: params[:id])
    @new_book = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
    if @book.reviews.blank?
      @average_review = 0
    else
      @average_review = @book.reviews.average(:rating).round(2)
    end
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path

  end


  def edit
    @book = Book.find(params[:id])
  end

  def form
  end

  private
  def book_params
      params.require(:book).permit(:title,:body,:rate)
  end

end
