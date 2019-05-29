class AdjustFieldsPhoto < ActiveRecord::Migration[5.2]
  def change
    remove_column :photos, :url
    add_column :photos, :data, :string
  end
end
