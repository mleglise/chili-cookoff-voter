class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.integer :user_id
      t.integer :event_id
      t.string :guest_type
      t.datetime :approved_at

      t.timestamps
    end
  end
end
