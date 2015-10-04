class Entry < ActiveRecord::Base
  belongs_to :event
  belongs_to :category
  belongs_to :owner,
    :class_name => 'User'

  validates_presence_of :event, :name, :category
end
