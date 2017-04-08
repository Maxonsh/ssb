class CreatePropertyGalleries < ActiveRecord::Migration[5.0]
  def change
    create_table :property_galleries do |t|
      t.integer :property_id
      t.string :images, :array => true, :default => []
      t.timestamps
    end
  end
end
