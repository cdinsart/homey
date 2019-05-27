class CreateDesks < ActiveRecord::Migration[5.2]
  def change
    create_table :desks do |t|
      t.string :title
      t.string :address
      t.integer :price
      t.text :description
      t.float :latitude
      t.float :longitude
      t.boolean :active, default: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
