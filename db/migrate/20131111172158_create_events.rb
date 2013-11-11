class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.date :event_date
      t.datetime :polls_open
      t.datetime :polls_close
      t.integer :owner_id

      t.timestamps
    end
  end
end
