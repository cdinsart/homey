class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :desk_rating
      t.integer :user_rating
      t.references :booking, foreign_key: true

      t.timestamps
    end
  end
end
