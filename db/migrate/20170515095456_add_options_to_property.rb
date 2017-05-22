class AddOptionsToProperty < ActiveRecord::Migration[5.0]
  def up
    add_column :properties, :lounge_room, :boolean, :default => false
    add_column :properties, :kitchen, :boolean, :default => false
    add_column :properties, :dinning_room, :boolean, :default => false
    add_column :properties, :laundry, :boolean, :default => false
    add_column :properties, :on_sweet, :boolean, :default => false
    add_column :properties, :powder_room, :boolean, :default => false
  end

  def down
    remove_column :properties, :lounge_room
    remove_column :properties, :kitchen
    remove_column :properties, :dinning_room
    remove_column :properties, :laundry
    remove_column :properties, :on_sweet
    remove_column :properties, :powder_room
  end
end
