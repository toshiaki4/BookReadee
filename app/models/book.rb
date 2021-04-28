class Book < ApplicationRecord
  belongs_to :user
  has_many :reviews

  def rate_average
    rates = self.reviews.pluck(:rate)

    if rates.empty?
      0
    else
      rate.sum / rate.length
    end
  end
end
