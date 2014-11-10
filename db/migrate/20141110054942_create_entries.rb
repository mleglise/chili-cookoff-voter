class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :name
      t.integer :owner_id
      t.integer :event_id
      t.integer :category_id
      t.boolean :has_meat
      t.integer :spice_level
      t.string :ingredients
      t.string :description

      t.timestamps
    end
  end
end
