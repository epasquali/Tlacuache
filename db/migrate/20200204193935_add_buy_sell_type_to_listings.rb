class AddBuySellTypeToListings < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :type, :string
    add_column :listings, :expires, :date
  end
end
