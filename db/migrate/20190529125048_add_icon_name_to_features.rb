class AddIconNameToFeatures < ActiveRecord::Migration[5.2]
  def change
    add_column :features, :icon_name, :string
  end
end
