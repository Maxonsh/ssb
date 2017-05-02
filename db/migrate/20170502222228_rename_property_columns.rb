class RenamePropertyColumns < ActiveRecord::Migration[5.0]
  def change
    rename_column :properties, :bed_rooms, :bedrooms
    rename_column :properties, :bath_rooms, :bathrooms
  end
end
