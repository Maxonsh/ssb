class AddLocationColumnsToProperty < ActiveRecord::Migration[5.0]
  def up
    add_column :properties, :address, :string, :null => false, :default => ''
    add_column :properties, :latitude, :float
    add_column :properties, :longitude, :float
  end

  def down
    remove_column :properties, :address
    remove_column :properties, :latitude
    remove_column :properties, :longitude
  end
end
