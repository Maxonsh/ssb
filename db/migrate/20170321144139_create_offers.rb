class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers do |t|
      t.text :description, :null => false
      t.integer :price
      t.string :type, :null => false
      t.integer :status, :null => false
      t.timestamps
    end
  end
end
