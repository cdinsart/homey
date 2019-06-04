class AddPaymentToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :payment, :jsonb
  end
end
