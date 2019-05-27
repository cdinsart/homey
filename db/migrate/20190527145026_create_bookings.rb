class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.date :date
      t.boolean :am
      t.boolean :pm
      t.integer :total_price
      t.string :status , default: 'pending'
      t.references :user, foreign_key: true
      t.references :desk, foreign_key: true

      t.timestamps
    end
  end
end
