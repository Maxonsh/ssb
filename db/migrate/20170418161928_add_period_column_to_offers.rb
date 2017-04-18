class AddPeriodColumnToOffers < ActiveRecord::Migration[5.0]
  def up
    add_column :offers, :period, :string
  end

  def down
    remove_column :offers, :period
  end
end
