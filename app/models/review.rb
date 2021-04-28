class Review < ApplicationRecord
  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true
  belongs_to :book
  def change
    add_column :reviews, :rate, :float, null: false, default: 0
    # floatにすることを推奨(小数点に対応できるため)。nullの制約は各自判断してください
  end
end
