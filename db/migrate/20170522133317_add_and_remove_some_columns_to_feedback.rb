class AddAndRemoveSomeColumnsToFeedback < ActiveRecord::Migration[5.0]
  def change
    remove_column :feedbacks, :contacts, :string
    add_column :feedbacks, :email, :string
    add_column :feedbacks, :phone_number, :integer
  end
end
