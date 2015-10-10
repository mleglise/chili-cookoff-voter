class Event < ActiveRecord::Base
  belongs_to :owner,
    :class_name => 'User'

  has_many :attendances

  has_many :guests,
    :class_name => 'User',
    :through => :attendances

  has_many :categories
  has_many :entries

  def self.newest
    order(event_date: :desc)
  end

  def find_attendee(user)
    attendances.where(guest: user).first
  end

  # Returns true if the user is attending the event
  def has_attendee?(user)
    !user.nil? && guests.exists?(user)
  end

  # Returns true if the user is attending as a chef
  def has_chef?(user)
    has_attendee?(user) && attendances.exists?(user_id: user.id, guest_type: 'chef')
  end

  # Returns true if we are DURING the polling period.
  def polls_open?
    Time.now > polls_open && Time.now < polls_close
  end

  # Returns true if we have passed the closing of the event.
  def polls_closed?
    Time.now > polls_close
  end

end
