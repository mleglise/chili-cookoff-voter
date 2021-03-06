class Attendance < ActiveRecord::Base
  belongs_to :guest,
    class_name: 'User',
    foreign_key: 'user_id'

  belongs_to :event

  validates_uniqueness_of :user_id, scope: :event_id

  def chef?
    guest_type == 'chef'
  end

  def completed?
    completed_at.present?
  end

  def all_done
    self.completed_at = Time.now
    save
  end
end
