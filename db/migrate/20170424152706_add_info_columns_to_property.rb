class AddInfoColumnsToProperty < ActiveRecord::Migration[5.0]
  def up
    add_column :properties, :bedrooms, :integer
    add_column :properties, :bathrooms, :integer
    add_column :properties, :car_parks, :integer
  end
  def down
    remove_column :properties, :bedrooms
    remove_column :properties, :bathrooms
    remove_column :properties, :car_parks
  end
end
