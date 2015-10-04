class Category < ActiveRecord::Base
  belongs_to :event
  has_many :entries
  validates_presence_of :event, :name
end
