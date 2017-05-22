class RenameCarParksColumnToCarSpaces < ActiveRecord::Migration[5.0]
  def change
    rename_column :properties, :car_parks, :car_spaces
  end
end
