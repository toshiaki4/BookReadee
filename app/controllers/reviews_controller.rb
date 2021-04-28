class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.save
    redirect_to book_path(@review.book)
  end

  private
    def review_params
      params.require(:review).permit(:book_id, :body)
    end
end
