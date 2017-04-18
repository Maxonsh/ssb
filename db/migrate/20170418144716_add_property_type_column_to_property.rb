class AddPropertyTypeColumnToProperty < ActiveRecord::Migration[5.0]
  def up
    add_column :properties, :property_type, :string, :null => false
  end

  def down
    remove_column :properties, :property_type
  end
end
