class RemoveColumnStateIdFromProperty < ActiveRecord::Migration[5.0]
  def change
    remove_column :properties, :state_id, :integer
  end
end
