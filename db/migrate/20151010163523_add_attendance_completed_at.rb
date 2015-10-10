class AddAttendanceCompletedAt < ActiveRecord::Migration
  def change
    add_column :attendances, :completed_at, :datetime
  end
end
