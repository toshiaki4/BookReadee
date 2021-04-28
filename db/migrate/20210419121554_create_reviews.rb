class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :body
      t.float :rate
      t.string :image_id
      t.integer :user_id
      t.integer :book_id

      t.timestamps
    end
  end
end
