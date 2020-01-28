class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.text :title
      t.text :description

      t.timestamps
    end
  end
end
