class RemoveNameColumnFromFeedbacks < ActiveRecord::Migration[5.0]
  def up
    remove_column :feedbacks, :name
  end

  def down
    add_column :feedbacks, :name, :string
  end
end
