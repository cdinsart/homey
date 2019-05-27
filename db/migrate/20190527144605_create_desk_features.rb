class CreateDeskFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :desk_features do |t|
      t.integer :value
      t.references :feature, foreign_key: true
      t.references :desk, foreign_key: true

      t.timestamps
    end
  end
end
