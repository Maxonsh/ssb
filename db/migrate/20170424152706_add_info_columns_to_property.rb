class AddInfoColumnsToProperty < ActiveRecord::Migration[5.0]
  def up
    add_column :properties, :bed_rooms, :integer
    add_column :properties, :bath_rooms, :integer
    add_column :properties, :car_parks, :integer
  end
  def down
    remove_column :properties, :bed_rooms
    remove_column :properties, :bath_rooms
    remove_column :properties, :car_parks
  end
end
