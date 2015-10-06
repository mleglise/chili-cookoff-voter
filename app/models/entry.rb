class Entry < ActiveRecord::Base
  belongs_to :event
  belongs_to :category
  belongs_to :owner,
    :class_name => 'User'

  has_many :ratings

  validates_presence_of :event, :name, :category

  def total_score
    ratings.sum(:score)
  end

  def avg_score
    total_score / ratings.count rescue 0
  end
end
