class AddStateToProperties < ActiveRecord::Migration[5.0]
  def change
    add_reference :properties, :state, :foreign_key => true
  end
end
