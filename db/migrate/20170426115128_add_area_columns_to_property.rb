class AddAreaColumnsToProperty < ActiveRecord::Migration[5.0]
  def up
    add_column :properties, :land_area, :integer
    add_column :properties, :floor_area, :integer
  end

  def down
    remove_column :properties, :land_area
    remove_column :properties, :floor_area
  end
end
