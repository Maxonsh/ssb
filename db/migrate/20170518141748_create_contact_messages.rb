class CreateContactMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :contact_messages do |t|
      t.text :message, :null => false
      t.string :email, :null => false
      t.integer :sender_id, :null => false
      t.boolean :approved_financing, :default => false

      t.timestamps
    end
  end
end
