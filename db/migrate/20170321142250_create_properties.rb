class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.belongs_to :offer, :index => true
      t.timestamps
    end
  end
end
