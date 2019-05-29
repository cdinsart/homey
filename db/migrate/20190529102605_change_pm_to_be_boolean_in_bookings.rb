class ChangePmToBeBooleanInBookings < ActiveRecord::Migration[5.2]
  def change
    change_column :bookings, :pm, :boolean, default: true
  end
end
