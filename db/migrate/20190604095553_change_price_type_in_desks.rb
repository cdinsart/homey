class ChangePriceTypeInDesks < ActiveRecord::Migration[5.2]
  def change
    remove_column :desks, :price
    add_monetize :desks, :price, currency: { present: false }
  end
end
