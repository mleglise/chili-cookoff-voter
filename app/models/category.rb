class Category < ActiveRecord::Base
  belongs_to :event
  validates_presence_of :event, :name
end
