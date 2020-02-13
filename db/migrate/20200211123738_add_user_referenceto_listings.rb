class AddUserReferencetoListings < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :user_id,  :integer
    add_index :listings, [:user_id, :created_at]
  end
end
