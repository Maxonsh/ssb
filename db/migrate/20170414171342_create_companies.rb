class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.integer :abn, :limit => 8
      t.boolean :abn_valid
      t.string :name
      t.json :abn_info
      t.timestamps
    end
  end
end
