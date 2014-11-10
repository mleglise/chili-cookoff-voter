class Event < ActiveRecord::Base
  belongs_to :owner,
    :class_name => 'User'

  has_many :attendances

  has_many :guests,
    :class_name => 'User',
    :through => :attendances

  def has_attendee?(user)
    !user.nil? && guests.exists?(user)
  end
end
