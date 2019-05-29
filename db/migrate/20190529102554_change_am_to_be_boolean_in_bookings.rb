class ChangeAmToBeBooleanInBookings < ActiveRecord::Migration[5.2]
  def change
    change_column :bookings, :am, :boolean, default: true
  end
end
